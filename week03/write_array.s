
N_SIZE = 10

main:

	# $t0	i

loop_init:
	li	$t0, 0		# i = 0;

loop_cond:
	bge	$t0, N_SIZE, loop_end

loop_body:
	li	$v0, 5		# scanf("%d", &numbers[i]);
	syscall
	# number user entered in $v0

	# get numbers[i]
	la	$t1, numbers	# $t1 = &numbers
	mul	$t2, $t0, 4	# $t2 = offset = i * sizeof(int)
	add	$t2, $t2, $t1	# $t2 = &numbers[i]

	sw	$v0, ($t2)

loop_step:
	addi	$t0, $t0, 1	# i++;
	b	loop_cond

loop_end:

	jr	$ra	# return;


	.data

# int numbers[N_SIZE] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
numbers:
	.space	40	# sizeof(int) * 10
