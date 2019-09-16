
addi $r1 $r0 0      ; Q = 0
addi $r2 $r0 N      ; N = N
addi $r3 $r0 D      ; D = D
addi $r6 $r0 1
sw $r2 3($r0)       ; save N to dataMem
sw $r3 4($r0)       ; save D to dataMem
lw $r3 3($r0)       ; load N from dataMem
lw $r4 4($r0)       ; load D from dataMem 
slt $r5 $r3 $r4     ; "while" D < R
beq $r5 $r6 3       ; branch to done
addi $r1 $r1 1
sub $r4 $r4 $r3
jump 9              ; jump to while
sw $r1 5($r0)       ; "done" save Q
sw $r4 6($r0)       ; save R