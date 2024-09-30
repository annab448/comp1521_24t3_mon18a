coord:	# coord(87, 99)
	.double 87
	.double 99

coord2:
	.space 16

# get x from coord
ld	$t0, coord
# get y
la	$t2, coord
ld	$t1, 8($t2)
