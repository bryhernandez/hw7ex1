.data   			# GLOBAL VARIABLES go in the data segment  
	f: .ascii "f= "
	g: .word 12
	h: .word 3
	j: .word 27
	
	
.text   			# All instructions go in the text segment 


# ***Begin the Main Program*** 

main:  
# f =  $s0  
# f = (g + h) - (j - 12)
	
# g = 12 -> g = $t0    
	lw $t0, g
# h = 3 -> h = $t1    
	lw $t1, h
# j = 27 -> j = $t2    
	lw $t2, j
# $t3 = (j - 12)    
	sub $t3, $t2, 12
# $t4 =  (g + h)    
	add $t4, $t0, $t1
# f = $t4 - $t3    
	sub $s0, $t4, $t3
# print out "f = " and $s0 
	li $v0, 4
	la $a0, f
	syscall
	
	li $v0, 1
	sub $a0, $t3, $t4
	syscall

# ** terminate program ** 
li $v0, 10     
syscall 
# ***End the Main Program***
