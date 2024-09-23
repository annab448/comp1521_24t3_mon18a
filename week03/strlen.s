
main:
	# $t0	s
	# $t1	length

	la	$t0, string	# char *s = &string[0];
	li	$t1, 0		# length = 0

while_string_cond:
	# get *s => dereference s
	lb	$t2, ($t0)	# $t2 = *s
	beq	$t2, '\0', while_string_end	# while (*s != '\0') {

	addi	$t1, $t1, 1	# length ++
	addi	$t0, $t0, 1	# s++

	b	while_string_cond

while_string_end:

	jr	$ra	# return;



	.data
# char *string = "....";
string:
	.asciiz  "...."
