/*
R/D

Q := 0
R := N
while R ≥ D do 
    Q := Q + 1
    R := R − D
end
return (Q, R) end
*/

addi r1 r0 0  ; Q = 0
addi r2 r0 N  ; N = N
addi r3 r0 D  ; D = D
add  r4 r2 r0 ; R = N
while: slt r5 r3 r4
beq r3 r4 lbl1
beq r5 r0 done
addi r1 r1 1
sub r4 r4 r3
jump while
lbl1: addi r1 r1 1
sub r4 r4 r3
done:

8/5
    D<R = 1
    continue
    continue
    q=1
    r=3
    j while
    D<R = 0
    continue
    done
    (q=1, r=3)

5/10
    D<R=1
    continue
    done
    (q=0, r=5)

10/5
    D<R=0
    continue
    continue
    q=1
    r=5
    j while
    D<R=0
    j lbl1
    q=2
    r=0
    (q=2, r=0)