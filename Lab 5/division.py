r0 = 0
r1 = r0 + 0 # Q
r2 = r0 + 20 # N
r3 = r0 + 5 # D
r6 = r0 + 1 # constant 1
mem3 = r2
mem4 = r3
r3 = mem3  #N 
r4 = mem4  #D
r5 = r3 < r4 # N D
while r5 != r6:
    r5 = r3 > r4
    r1 = r1 + 1
    r4 = r4 - r3
print(r1)
print(r4)