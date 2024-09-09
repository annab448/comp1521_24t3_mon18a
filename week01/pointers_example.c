int number = 9;				// create an integer
int *num_ptr = &number		// & => get address of a variable
int x = *num_ptr			// dereference, or get value at a pointer
*num_ptr = *num_ptr + 10;	// increase number by 10
printf("%d", number);		// will print 19
