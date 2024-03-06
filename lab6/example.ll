define i32 @(i32 %t0) {
B36:
  %t44 = alloca i32, align 4
  %t43 = alloca [10 x i32], align 4
  %t37 = alloca i32, align 4
  store i32 %t0, i32* %t37, align 4
  %t2 = load i32, i32* %t37, align 4
  %t3 = icmp slt i32 %t2, 4
  br i1 %t3, label %B38, label %B42
B38:                               	; preds = %B36
  %t4 = load i32, i32* %t37, align 4
  ret i32 %t4
  br label %B39
B42:                               	; preds = %B36
  br label %B39
B39:                               	; preds = %B38, %B42
  %t6 = getelementptr inbounds [10 x i32], [10 x i32]* %t43, i32 0, i32 0
  store i32 0, i32* %t6, align 4
  %t7 = getelementptr inbounds [10 x i32], [10 x i32]* %t43, i32 0, i32 1
  store i32 1, i32* %t7, align 4
  %t8 = getelementptr inbounds [10 x i32], [10 x i32]* %t43, i32 0, i32 2
  store i32 2, i32* %t8, align 4
  store i32 3, i32* %t44, align 4
  br label %B45
B45:                               	; preds = %B39, %B46
  %t11 = load i32, i32* %t44, align 4
  %t12 = load i32, i32* %t37, align 4
  %t13 = add i32 %t12, 1
  %t14 = icmp slt i32 %t11, %t13
  br i1 %t14, label %B46, label %B50
B46:                               	; preds = %B45
  %t17 = load i32, i32* %t44, align 4
  %t18 = sub i32 %t17, 1
  %t19 = getelementptr inbounds [10 x i32], [10 x i32]* %t43, i32 0, i32 %t18
  %t51 = load i32, i32* %t19, align 4
  %t20 = load i32, i32* %t44, align 4
  %t21 = sub i32 %t20, 2
  %t22 = getelementptr inbounds [10 x i32], [10 x i32]* %t43, i32 0, i32 %t21
  %t52 = load i32, i32* %t22, align 4
  %t23 = add i32 %t51, %t52
  %t15 = load i32, i32* %t44, align 4
  %t16 = getelementptr inbounds [10 x i32], [10 x i32]* %t43, i32 0, i32 %t15
  store i32 %t23, i32* %t16, align 4
  %t25 = load i32, i32* %t44, align 4
  %t26 = add i32 %t25, 1
  store i32 %t26, i32* %t44, align 4
  br label %B45
B50:                               	; preds = %B45
  br label %B47
B47:                               	; preds = %B50
  %t27 = load i32, i32* %t37, align 4
  %t28 = getelementptr inbounds [10 x i32], [10 x i32]* %t43, i32 0, i32 %t27
  %t53 = load i32, i32* %t28, align 4
  ret i32 %t53
}
define i32 @main() {
B54:
  %t56 = alloca i32, align 4
  %t55 = alloca i32, align 4
  store i32 5, i32* %t56, align 4
  %t33 = load i32, i32* %t56, align 4
  %t34 = call i32 @(i32 %t33)
  store i32 %t34, i32* %t55, align 4
  %t35 = load i32, i32* %t55, align 4
  ret i32 %t35
}
