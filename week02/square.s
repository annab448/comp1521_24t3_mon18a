SQUARE_MAX = 46340

main:
	# $t0	x
	# $t1	y

	li	$v0, 4		# printf("Enter a number: ");
	la	$a0, prompt
	syscall	

	li	$v0, 5		# scanf("%d", &x);
	syscall
	move	$t0, $v0	# x in $t0

	ble	$t0, SQUARE_MAX, square_x	# if (x <= SQUARE_MAX) goto square_x;

x_too_big:
	li	$v0, 4		# printf("square too big for 32 bits\n");
	la	$a0, too_big_msg
	syscall

	b	epilogue


square_x:
	mul	$t1, $t0, $t0	# y = x * x;

	li	$v0, 1		#printf("%d", y)
	move	$a0, $t1
	syscall

	li	$v0, 11		# printf("\n")
	li	$a0, '\n'
	syscall

epilogue:
	li	$v0, 0		# return 0;
	jr	$ra

	.data
prompt:
	.asciiz "Enter a number: "

too_big_msg:
	.asciiz "square too big for 32 bits\n"
