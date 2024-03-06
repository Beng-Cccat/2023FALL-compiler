#include <algorithm>
#include "LinearScan.h"
#include "MachineCode.h"
#include "LiveVariableAnalysis.h"

LinearScan::LinearScan(MachineUnit *unit)
{
    this->unit = unit;
    for (int i = 4; i < 11; i++)
        regs.push_back(i);
}

void LinearScan::allocateRegisters()
{
    for (auto &f : unit->getFuncs())
    {
        func = f;
        bool success;
        success = false;
        while (!success)        // repeat until all vregs can be mapped
        {
            computeLiveIntervals();
            success = linearScanRegisterAllocation();
            if (success)        // all vregs can be mapped to real regs
                modifyCode();
            else                // spill vregs that can't be mapped to real regs
                genSpillCode();
        }
    }
}

void LinearScan::makeDuChains()
{
    LiveVariableAnalysis lva;
    lva.pass(func);
    du_chains.clear();
    int i = 0;
    std::map<MachineOperand, std::set<MachineOperand *>> liveVar;
    for (auto &bb : func->getBlocks())
    {
        liveVar.clear();
        for (auto &t : bb->getLiveOut())
            liveVar[*t].insert(t);
        int no;
        no = i = bb->getInsts().size() + i;
        for (auto inst = bb->getInsts().rbegin(); inst != bb->getInsts().rend(); inst++)
        {
            (*inst)->setNo(no--);
            for (auto &def : (*inst)->getDef())
            {
                if (def->isVReg())
                {
                    auto &uses = liveVar[*def];
                    du_chains[def].insert(uses.begin(), uses.end());
                    auto &kill = lva.getAllUses()[*def];
                    std::set<MachineOperand *> res;
                    set_difference(uses.begin(), uses.end(), kill.begin(), kill.end(), inserter(res, res.end()));
                    liveVar[*def] = res;
                }
            }
            for (auto &use : (*inst)->getUse())
            {
                if (use->isVReg())
                    liveVar[*use].insert(use);
            }
        }
    }
}

void LinearScan::computeLiveIntervals()
{
    makeDuChains();
    intervals.clear();
    for (auto &du_chain : du_chains)
    {
        int t = -1;
        for (auto &use : du_chain.second)
            t = std::max(t, use->getParent()->getNo());
        Interval *interval = new Interval({du_chain.first->getParent()->getNo(), t, false, 0, 0, {du_chain.first}, du_chain.second});
        intervals.push_back(interval);
    }
    for (auto& interval : intervals) {
        auto uses = interval->uses;
        auto begin = interval->start;
        auto end = interval->end;
        for (auto block : func->getBlocks()) {
            auto liveIn = block->getLiveIn();
            auto liveOut = block->getLiveOut();
            bool in = false;
            bool out = false;
            for (auto use : uses)
                if (liveIn.count(use)) {
                    in = true;
                    break;
                }
            for (auto use : uses)
                if (liveOut.count(use)) {
                    out = true;
                    break;
                }
            if (in && out) {
                begin = std::min(begin, (*(block->begin()))->getNo());
                end = std::max(end, (*(block->rbegin()))->getNo());
            } else if (!in && out) {
                for (auto i : block->getInsts())
                    if (i->getDef().size() > 0 &&
                        i->getDef()[0] == *(uses.begin())) {
                        begin = std::min(begin, i->getNo());
                        break;
                    }
                end = std::max(end, (*(block->rbegin()))->getNo());
            } else if (in && !out) {
                begin = std::min(begin, (*(block->begin()))->getNo());
                int temp = 0;
                for (auto use : uses)
                    if (use->getParent()->getParent() == block)
                        temp = std::max(temp, use->getParent()->getNo());
                end = std::max(temp, end);
            }
        }
        interval->start = begin;
        interval->end = end;
    }
    bool change;
    change = true;
    while (change)
    {
        change = false;
        std::vector<Interval *> t(intervals.begin(), intervals.end());
        for (size_t i = 0; i < t.size(); i++)
            for (size_t j = i + 1; j < t.size(); j++)
            {
                Interval *w1 = t[i];
                Interval *w2 = t[j];
                if (**w1->defs.begin() == **w2->defs.begin())
                {
                    std::set<MachineOperand *> temp;
                    set_intersection(w1->uses.begin(), w1->uses.end(), w2->uses.begin(), w2->uses.end(), inserter(temp, temp.end()));
                    if (!temp.empty())
                    {
                        change = true;
                        w1->defs.insert(w2->defs.begin(), w2->defs.end());
                        w1->uses.insert(w2->uses.begin(), w2->uses.end());
                        // w1->start = std::min(w1->start, w2->start);
                        // w1->end = std::max(w1->end, w2->end);
                        auto w1Min = std::min(w1->start, w1->end);
                        auto w1Max = std::max(w1->start, w1->end);
                        auto w2Min = std::min(w2->start, w2->end);
                        auto w2Max = std::max(w2->start, w2->end);
                        w1->start = std::min(w1Min, w2Min);
                        w1->end = std::max(w1Max, w2Max);
                        auto it = std::find(intervals.begin(), intervals.end(), w2);
                        if (it != intervals.end())
                            intervals.erase(it);
                    }
                }
            }
    }
    sort(intervals.begin(), intervals.end(), compareStart);
}

//intervals表示还未分配寄存器的活跃区间，所有interval按照开始位置进行递增排序
//active表示当前正在占用物理寄存器的活跃区间集合，其中inteval按照结束位置进行递增排序
bool LinearScan::linearScanRegisterAllocation()
{
    // Todo
    /*
        active ←{}
        对每个活跃区间
        foreach live interval i, in order of increasing start point
            处理旧的寄存器
            ExpireOldIntervals(i)
            如果active列表中interval的数目和可用的物理寄存器数目相等
            说明当前所有物理寄存器都被占用，需要进行寄存器溢出操作
            if length(active) = R then
                SpillAtInterval(i)
            不相等说明当前有可用于分配的物理寄存器
            else
                为区间i分配物理寄存器
                register[i] ← a register removed from pool of free registers
                按照活跃区间结束位置将其插入active列表中
                add i to active, sorted by increasing end point
    */
   //ffc
   //清空
    active.clear();
    regs.clear();
    //设置可用寄存器范围
    for (int i = 4; i < 11; i++)
        regs.push_back(i);
    for (auto& interval : intervals) {
        expireOldIntervals(interval);//回收可回收的物理寄存器
        if (regs.empty()) {
            spillAtInterval(interval);//寄存器溢出
            return false;
        } else {
            //分配
            interval->rreg = regs.front();
            //从空寄存器中移除
            regs.erase(regs.begin());
            //活跃
            active.push_back(interval);
            //按照活跃结束时间递增排序
            sort(active.begin(), active.end(), compareEnd);
        }
    }

    return true;
}

void LinearScan::modifyCode()
{
    for (auto &interval : intervals)
    {
        func->addSavedRegs(interval->rreg);
        for (auto def : interval->defs)
            def->setReg(interval->rreg);
        for (auto use : interval->uses)
            use->setReg(interval->rreg);
    }
}

void LinearScan::genSpillCode()
{
    for(auto &interval:intervals)
    {
        if(!interval->spill)
            continue;
        // TODO
        /* HINT:
         * The vreg should be spilled to memory.
         * 1. insert ldr inst before the use of vreg
         * 2. insert str inst after the def of vreg
         */ 
        //ffc
        //栈中分配的内存
        interval->disp = -func->AllocSpace(4);
        auto off = new MachineOperand(MachineOperand::IMM, interval->disp);
        auto fp = new MachineOperand(MachineOperand::REG, 11);
        //遍历引用-操作数
        for (auto use : interval->uses) {
            auto temp = new MachineOperand(*use);
            MachineOperand* operand = nullptr;
            //如果分配的指令超出立即数范围
            if (interval->disp > 255 || interval->disp < -255) {
                //创建虚拟寄存器
                operand = new MachineOperand(MachineOperand::VREG,SymbolTable::getLabel());
                //将off存入虚拟寄存器
                auto inst1 = new LoadMInstruction(use->getParent()->getParent(),operand, off);
                //在引用指令前面插入读取指令
                use->getParent()->insertBefore(inst1);
            }
            //溢出的在引用前需要load指令
            if (operand) {
                auto inst =new LoadMInstruction(use->getParent()->getParent(), temp,fp, new MachineOperand(*operand));
                use->getParent()->insertBefore(inst);
            } else {
                auto inst = new LoadMInstruction(use->getParent()->getParent(),temp, fp, off);
                use->getParent()->insertBefore(inst);
            }
        }
        //遍历定义
        for (auto def : interval->defs) {
            auto temp = new MachineOperand(*def);
            MachineOperand* operand = nullptr;
            MachineInstruction *inst1 = nullptr, *inst = nullptr;
            //如果偏移量超过范围
            if (interval->disp > 255 || interval->disp < -255) {
                //先把偏移量取到寄存器中
                operand = new MachineOperand(MachineOperand::VREG,SymbolTable::getLabel());
                inst1 = new LoadMInstruction(def->getParent()->getParent(),operand, off);
                def->getParent()->insertAfter(inst1);
            }
            //溢出在定义后需要store指令
            if (operand)
                inst =new StoreMInstruction(def->getParent()->getParent(), temp,fp, new MachineOperand(*operand));
            else
                inst = new StoreMInstruction(def->getParent()->getParent(),temp, fp, off);
            if (inst1)
                inst1->insertAfter(inst);
            else
                def->getParent()->insertAfter(inst);
        }
    }
}


void LinearScan::expireOldIntervals(Interval *interval)
{
    // Todo
    /*
        foreach interval j in active, in order of increasing end point
            从active开头开始遍历，由于递增，如果第一个不满足条件的话所有都不满足
            if endpoint[j] ≥ startpoint[i] then
                return
            如果j中有满足活跃区间在i之前的，回收分配的寄存器
            remove j from active
            放回空寄存器
            add register[j] to pool of free registers
    */
   //ffc
    auto it = active.begin();
    //从active开头开始遍历
    while (it != active.end()) {
        if ((*it)->end >= interval->start)
            return;
        //放回空的寄存器
        regs.push_back((*it)->rreg);
        //如果j中有满足活跃区间在i之前的，回收分配的寄存器
        it = active.erase(find(active.begin(), active.end(), *it));
        sort(regs.begin(), regs.end());
    }
}

void LinearScan::spillAtInterval(Interval *interval)
{
    // Todo
    /*
        spill ← last interval in active
        将活跃时间更长的，也就是活跃结束时间更晚的溢出到栈中
        if endpoint[spill] > endpoint[i] then
            将其占用的寄存器分配给区间i
            register[i] ← register[spill]
            置位spill标志位
            为其在栈内分配空间
            location[spill] ← new stack location
            遍历use指令的列表，在use指令前插入load指令
            遍历def指令的列表，在def指令后插入store指令
            remove spill from active
            将区间i插入到active列表中
            add i to active, sorted by increasing end point
        else
            location[i] ← new stack location

    */
   //ffc
    auto spill = active.back();
    if (spill->end > interval->end) {
        spill->spill = true;//结束更晚则溢出
        //把寄存器给结束时间更早的
        interval->rreg = spill->rreg;
        active.push_back(interval);
        sort(active.begin(), active.end(), compareEnd);
    } else {
        interval->spill = true;
    }
}

bool LinearScan::compareStart(Interval *a, Interval *b)
{
    return a->start < b->start;
}
//ffc
bool LinearScan::compareEnd(Interval* a, Interval* b) {
    return a->end < b->end;
}