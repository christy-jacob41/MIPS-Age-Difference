# Practice program 1

.data
userAge:	.word	3
neighborAge:	.word	4
ageDifference:	.word	5
promptUserName:	.asciiz	"What is the user's name?"
promptNeighborName:	.asciiz	"What is the neighbor's name?"
promptUserAge:	.asciiz "What is the user's age?"
promptNeighborAge:	.asciiz	"What is the neighbor's age?"
userName: 	.space	20
neighborName:	.space	20
ageDifferenceMessage:	.asciiz	"Age difference is: "

.text
main:
	#promptm and take in user's name and age
	li	$v0, 4
	la 	$a0, promptUserName
	syscall
	li	$v0, 8
	la	$a0, userName
	la	$a1, 20
	syscall
	
	li	$v0, 4
	la	$a0, promptUserAge
	syscall
	li	$v0, 5 # 5 - gets int from user
	syscall
	sw	$v0, userAge
	
	#promptm and take in neighbor's name and age
	li	$v0, 4
	la 	$a0, promptNeighborName
	syscall
	li	$v0, 8
	la	$a0, neighborName
	la	$a1, 20
	syscall
	
	li	$v0, 4
	la	$a0, promptNeighborAge
	syscall
	li	$v0, 5 # 5 - gets int from user
	syscall
	sw	$v0, neighborAge
	
	#calculating differences in age
	lw	$t1, userAge
	lw	$t2, neighborAge	
	sub	$t3, $t1, $t2	#t3 = t1-t2
	sw	$t3, ageDifference
			
	#print user and neighbor name and age
	li	$v0, 4
	la	$a0, userName
	syscall 
	li	$v0, 1	# 1- print int
	lw	$a0, userAge
	syscall
	
	li	$v0, 4
	la	$a0, neighborName
	syscall
	li	$v0, 1
	lw	$a0, neighborAge
	syscall
	
	#printing age difference
	li	$v0, 4
	la	$a0, ageDifferenceMessage
	syscall
	li	$v0, 1	# use 1 to print words
	lw	$a0, ageDifference	# use lw to load words
	syscall
	
	#exit program
	li	$v0, 10
	syscall

