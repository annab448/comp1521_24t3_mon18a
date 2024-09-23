main:
	# $t0	x

loop_init:
	li	$t0, 24	# x = 24;

loop_cond:
	bge	$t0, 42, loop_end	#

loop_body:
	li	$v0, 1
	move 	$a0, $t0
	syscall

print_loop_init:
print_cond:
print_body:
print_step:
print_end:

	# printf("\n")

loop_step:
	add	$t0, $t0, 3
	j	loop_cond

loop_end:
	jr	$ra
