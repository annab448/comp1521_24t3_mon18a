N_SIZE = 10

main:
	# $t0, i

	li	$t0, 0		# i = 0;
loop_cond:
	bge	$t0, N_SIZE, loop_end	# while (i < N_SIZE) {

	# get &numbers[i] = &numbers + i*sizeof(int)

	mul	$t1, $t0, 4		# i*sizeof(int)
	lw	$t2, numbers($t1)	# load from &numbers + $t1
	# numbers[i] in $t2

	bgez	$t2, loop_step		#  if (numbers[i] < 0) {

	add	$t2, $t2, 42		# $t2 += 42
	sw	$t2, numbers($t1)

loop_step:
	addi	$t0, $t0, 1		# i++
	b	loop_cond
	

loop_end:
	jr	$ra

	.data
numbers: # int numbers[N_SIZE] = {0, 1, 2, -3, 4, -5, 6, -7, 8, 9};
	.word	0, 1, 2, -3, 4, -5, 6, -7, 8, 9	
