# Exercise 3
# Max Score: 12 points
# Students: Brian Flores, Joseph Wallace, Jose Elizarraras
# Overall percent effort: 33%,33%,33%
.data	
list1:		.word		3, 9, 1, 2, 6, 3, -4, -7, -8, 4, -2,  8, 7, 6
.text 		# list1 is an array of integers storing the given sequence of values	 
.globl	tomato
tomato: 
addi	$sp, $sp, -8       
addi	$t0, $a0, -1       
sw  	$t0, 0($sp)        
sw  	$ra, 4($sp)        
bne 	$a0, $zero, orange   
li  	$v0, 0             
addi	$sp, $sp, 8        
jr 	$ra                  
orange:   
move  $a0, $t0            
jal   	tomato 
lw    	$t0, 0($sp)  
sll	$t1, $t0, 2  
add   	$t1, $t1, $a1     
lw    	$t2, 0($t1)       
add   	$v0, $v0, $t2     
lw    	$ra, 4($sp)                
addi 	$sp, $sp, 8        
jr 	$ra                  
# main function starts here                                            						
.globl main
main:	
    addi	$sp, $sp, -4	# Make space on stack
	sw	$ra, 0($sp)	# Save return address
	la	$a1, list1	# a1 has the base address pointing to the first 
# element of the “list1” array declared in .data section above
	li	$a0, 9		# loads the immediate value into the destination register
	jal	tomato	
return:	
li	$v0, 0			# Return value
	lw	$ra, 0($sp)		# Restore return address
	addi	$sp, $sp, 4		# Restore stack pointer
	jr 	$ra			# Return
# Step through this code in your simulator and monitor the register values. 
# What does the tomato function do?   
# Write your answer HERE tomato 
# adds 2 to the stack, 
# we decrease a0 from 9->8
# we store the first word at the top of the stack
# return address at the second from the top of the stack
# check if a0 !=0
# we loop through Tomato 9 times
# added 3, 9, 1, 2, 6, 3, -4, -7, -8 ended at 5
# solution: the tomato function adds the first 9 elements in the array together using a pointer to iterate through the array until we iterate through the loop 9 times.
#                
