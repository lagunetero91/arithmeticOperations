.text
.globl normal

#####################################################################
# Argument:
# 	$a0: First number
#	$a1: Second number
#	$a2: operation ('+':add, '-':sub, '*':mul, '/':div)
# Return:
#	$v0: ($a0+$a1) | ($a0-$a1) | ($a0*$a1):LO | ($a0 / $a1)
# 	$v1: ($a0 * $a1):HI | ($a0 % $a1)
#####################################################################

normal:

# Check operation
	beq $a2, 43, sum
	beq $a2, 45, subs
	beq $a2, 47, divi
	beq $a2, 42, multi	
#Sum	
sum:	add $v0, $a0,$a1
	j return
#sub
subs:	sub $v0,$a0,$a1
	j return
#division
divi:	div $a0, $a1
	mflo $v0
	mfhi $v1
	j return
#multiplication
multi:	mult $a0, $a1
	mflo $v0
	mfhi $v1
	j return

return:	jr	$ra
