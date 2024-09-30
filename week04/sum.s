

main:
	# $ra => whatever in the emulator calls main functions
	
main__prologue:
	begin
	push	$ra		# the address main should return to

main__body:
	li	$a0, 11		# int result = sum4(11, 13, 17, 19);
	li	$a1, 13
	li	$a2, 17
	li	$a3, 19
	jal	sum4		# $ra = line 12 

	move	$a0, $v0
	li	$v0, 1		# printf("%d\n", result);
	syscall

	li	$v0, 11
	li	$a0, '\n'
	syscall

main__epilogue:

	pop	$ra
	end

	li	$v0, 0
	jr	$ra



sum4:
	# a in $a0, b in $a1, c in $a2, d in $a3
	# $s0	res1
	# $s1	c
	# $s2	d
sum4__prologue:
	begin
	push	$ra
	push	$s0
	push	$s1
	push	$s2	# main's version of $s2

sum4__body:
	move	$s1, $a2	# c
	move	$s2, $a3	# d

	jal	sum2		# int res1 = sum2(a, b);
	move	$s0, $v0

	move	$a0, $s1	# int res2 = sum2(c, d);
	move	$a1, $s2
	jal	sum2

	move	$a0, $s0	# sum2 (res1, res2);
	move	$a1, $v0
	jal	sum2		# sum is in $v0
	

sum4__epilogue:
	pop	$s2
	pop	$s1
	pop	$s0
	pop	$ra
	end

	jr	$ra




sum2:
	# x in $a0, y in $a1
	add	$v0, $a0, $a1		# return x + y;

	jr	$ra







