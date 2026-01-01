.data

    num1: .word 10
    num2: .word 20
    res:  .word 0
    msg:  .asciiz "The result is: "
    
    
    TAB: .space 20 #5*4byte=20
    
    msg3: .space 100

.text
.globl main
main:
    # 1
    la $t0, num1        
    lw $s0, 0($t0)      
    
    la $t1, num2
    lw $s1, 0($t1)      
    
    add $s2, $s0, $s1   # $s2 = 30

    # 2
    li $v0, 4           
    la $a0, msg         
    syscall

    # 3
    li $v0, 1           
    move $a0, $s2       
    syscall
    #
    la $t3,res
    sw $s2, 0($t3)
    
    # ## #
    li $a0, 10          #  ASCII new line
    li $v0, 11          # code one char
    syscall

    # 4
    la $t0, TAB         
    li $t1, 0           
    li $t2, 5           

Loop:
    beq  $t1, $t2, EndLoop 

    
    li $v0, 5
    syscall


    sw $v0, 0($t0)      
    

    addi $t1, $t1, 1    # i++
    addi $t0, $t0, 4    
    
    j Loop              

EndLoop:
    
    li $v0, 12        
    syscall 
    
    # 5
    la $a0, msg3      
    li $a1, 100        
    li $v0, 8           
    syscall             
    
   
   
   
   
   
   
    li $v0, 10
    syscall














