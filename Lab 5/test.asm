;Q := 0; R := N
;while R ≥ D do
;while 0 ≥ D - R do
;    Q := Q + 1
;    R := R − D
;end
;return (Q, R) end

addi $r1 $r0 0 ; Q
addi $r2 $r0 N ; N
addi $r3 $r0 D ; D
add  $r4 $r0 $r2 ; R
    while:
    slt  $r5 $r3 $r4
    beq  $r5 $r0 done
    addi $r1 $r1 1
    sub  $r4 $r4 $r3
    j while
    done:
while:
slt  $r5 $r3 $r4
beq  $r5 $r0 done
addi $r1 $r1 1
sub  $r4 $r4 $r3
j while
done:



8/5
5 < 8   1
1 = 0   while
q = 1
r = 3
5 < 3   0
0 = 0   done


10/5
5 < 10  1
1 = 0   while
q = 0
r = 5
5 < 5   0
0 = 0   done