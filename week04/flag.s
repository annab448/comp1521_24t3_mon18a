FLAG_ROWS = 6
FLAG_COLS = 12

main:

	# $t0	row
	# $t1	col

	li	$t0, 0		# row = 0
row_loop:
	bge	$t0, FLAG_ROWS, row_loop_end	#  while (row < FLAG_ROWS) {

	li	$t1, 0		# col = 0
col_loop:
	bge	$t1, FLAG_COLS, col_loop_end	# while (col < FLAG_COLS)

	# get the address of flag[row][col]
	mul	$t2, $t0, FLAG_COLS		# $t2 = row*sizeof(row)
	add	$t2, $t2, $t1			# $t2 += col

	lb	$a0, flag($t2)			# $a0 = flag[row][col]

	li	$v0, 11				# printf("%c", flag[row][col]);
	syscall


	addi	$t1, $t1, 1	# col++
	b col_loop

col_loop_end:

	li	$v0, 11		# printf("\n");
	li	$a0, '\n'
	syscall

	addi	$t0, $t0, 1	# row++
	b row_loop

row_loop_end:
	
	jr	$ra		# return;




	.data
flag:
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
	.byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
