ascii_0 = global i32 48, align 4
define i32 @my_getint() {
B66:
  %t68 = alloca i32, align 4
  %t67 = alloca i32, align 4
  store i32 0, i32* %t67, align 4
  br label %B69
B69:                               	; preds = %B66, %B75, %B76, %B77
  %t3 = icmp ne i32 1, 0
  br i1 %t3, label %B70, label %B73
B70:                               	; preds = %B69
  %t5 = call i32 @getch()
  %t6 = load i32, i32* ascii_0, align 4
  %t7 = sub i32 %t5, %t6
  store i32 %t7, i32* %t68, align 4
  %t8 = load i32, i32* %t68, align 4
  %t9 = icmp slt i32 %t8, 0
  br i1 %t9, label %B75, label %B81
B73:                               	; preds = %B69
  br label %B71
B75:                               	; preds = %B70, %B78
  br label %B69
B81:                               	; preds = %B70
  br label %B78
B71:                               	; preds = %B73
  %t14 = load i32, i32* %t68, align 4
  store i32 %t14, i32* %t67, align 4
  br label %B87
B78:                               	; preds = %B81
  %t10 = load i32, i32* %t68, align 4
  %t11 = icmp sgt i32 %t10, 9
  br i1 %t11, label %B75, label %B84
B87:                               	; preds = %B71, %B94, %B95
  %t15 = icmp ne i32 1, 0
  br i1 %t15, label %B88, label %B91
B84:                               	; preds = %B78
  br label %B76
B88:                               	; preds = %B87
  %t17 = call i32 @getch()
  %t18 = load i32, i32* ascii_0, align 4
  %t19 = sub i32 %t17, %t18
  store i32 %t19, i32* %t68, align 4
  %t20 = load i32, i32* %t68, align 4
  %t21 = icmp sge i32 %t20, 0
  br i1 %t21, label %B96, label %B99
B91:                               	; preds = %B87
  br label %B89
B76:                               	; preds = %B84
  br label %B69
B96:                               	; preds = %B88
  %t22 = load i32, i32* %t68, align 4
  %t23 = icmp sle i32 %t22, 9
  br i1 %t23, label %B93, label %B102
B99:                               	; preds = %B88
  br label %B94
B89:                               	; preds = %B91
  %t30 = load i32, i32* %t67, align 4
  ret i32 %t30
B93:                               	; preds = %B96
  %t26 = load i32, i32* %t67, align 4
  %t27 = mul i32 %t26, 10
  %t28 = load i32, i32* %t68, align 4
  %t29 = add i32 %t27, %t28
  store i32 %t29, i32* %t67, align 4
  br label %B95
B102:                               	; preds = %B96
  br label %B94
B94:                               	; preds = %B99, %B102
  br label %B87
B95:                               	; preds = %B93, %B103
  br label %B87
}
define void @my_putint(i32 %t31) {
B104:
  %t107 = alloca i32, align 4
  %t106 = alloca [16 x i32], align 4
  %t105 = alloca i32, align 4
  store i32 %t31, i32* %t105, align 4
  store i32 0, i32* %t107, align 4
  br label %B108
B108:                               	; preds = %B104, %B109
  %t35 = load i32, i32* %t105, align 4
  %t36 = icmp sgt i32 %t35, 0
  br i1 %t36, label %B109, label %B113
B109:                               	; preds = %B108
  %t39 = load i32, i32* %t105, align 4
  %t40 = srem i32 %t39, 10
  %t41 = load i32, i32* ascii_0, align 4
  %t42 = add i32 %t40, %t41
  %t37 = load i32, i32* %t107, align 4
  %t38 = getelementptr inbounds [16 x i32], [16 x i32]* %t106, i32 0, i32 %t37
  store i32 %t42, i32* %t38, align 4
  %t44 = load i32, i32* %t105, align 4
  %t45 = sdiv i32 %t44, 10
  store i32 %t45, i32* %t105, align 4
  %t47 = load i32, i32* %t107, align 4
  %t48 = add i32 %t47, 1
  store i32 %t48, i32* %t107, align 4
  br label %B108
B113:                               	; preds = %B108
  br label %B110
B110:                               	; preds = %B113
  br label %B114
B114:                               	; preds = %B110, %B115
  %t49 = load i32, i32* %t107, align 4
  %t50 = icmp sgt i32 %t49, 0
  br i1 %t50, label %B115, label %B119
B115:                               	; preds = %B114
  %t52 = load i32, i32* %t107, align 4
  %t53 = sub i32 %t52, 1
  store i32 %t53, i32* %t107, align 4
  %t54 = load i32, i32* %t107, align 4
  %t55 = getelementptr inbounds [16 x i32], [16 x i32]* %t106, i32 0, i32 %t54
  %t120 = load i32, i32* %t55, align 4
  call void @putch(i32 %t120)
  br label %B114
B119:                               	; preds = %B114
  br label %B116
B116:                               	; preds = %B119
  ret void
}
define i32 @main() {
B121:
  %t129 = alloca i32, align 4
  %t122 = alloca i32, align 4
  %t56 = call i32 @my_getint()
  store i32 %t56, i32* %t122, align 4
  br label %B123
B123:                               	; preds = %B121, %B124
  %t58 = load i32, i32* %t122, align 4
  %t59 = icmp sgt i32 %t58, 0
  br i1 %t59, label %B124, label %B128
B124:                               	; preds = %B123
  %t60 = call i32 @my_getint()
  store i32 %t60, i32* %t129, align 4
  %t62 = load i32, i32* %t129, align 4
  call void @my_putint(i32 %t62)
  call void @putch(i32 10)
  %t64 = load i32, i32* %t122, align 4
  %t65 = sub i32 %t64, 1
  store i32 %t65, i32* %t122, align 4
  br label %B123
B128:                               	; preds = %B123
  br label %B125
B125:                               	; preds = %B128
  ret i32 0
}
declare i32 @getch()
declare void @putch(i32)
