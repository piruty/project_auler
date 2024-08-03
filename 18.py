ll = []
ll.append([75])
ll.append([95,64])
ll.append([17,47,82])
ll.append([18,35,87,10])
ll.append([20, 4,82,47,65])
ll.append([19, 1,23,75, 3,34])
ll.append([88, 2,77,73, 7,63,67])
ll.append([99,65, 4,28, 6,16,70,92])
ll.append([41,41,26,56,83,40,80,70,33])
ll.append([41,48,72,33,47,32,37,16,94,29])
ll.append([53,71,44,65,25,43,91,52,97,51,14])
ll.append([70,11,33,28,77,73,17,78,39,68,17,57])
ll.append([91,71,52,38,17,14,91,43,58,50,27,29,48])
ll.append([63,66, 4,68,89,53,67,30,73,16,69,87,40,31])
ll.append([ 4,62,98,27,23, 9,70,98,73,93,38,53,60, 4,23])

ma = 0

for a in [0]:
    for b in range(0, 2):
        print(b)
        if b < a or b > a + 1:
            continue
        for c in range(0, 3):
            if c < b or c > b + 1:
                continue
            for d in range(0, 4):
                if c < b or c > b + 1:
                    continue
                for e in range(0, 5):
                    if e < c or e > c + 1:
                        continue
                    for f in range(0, 6):
                        if f < e or f > e + 1:
                            continue
                        for g in range(0, 7):
                            if g < f or g > f + 1:
                                continue
                            for h in range(0, 8):
                                if h < g or h > g + 1:
                                    continue
                                for i in range(0, 9):
                                    if i < h or i > h + 1:
                                        continue
                                    for j in range(0, 10):
                                        if j < i or j > i + 1:
                                            continue
                                        for k in range(0, 11):
                                            if k < j or k > j + 1:
                                                continue
                                            for l in range(0, 12):
                                                if l < k or l > k + 1:
                                                    continue
                                                for m in range(0, 13):
                                                    if m < l or m > l + 1:
                                                        continue
                                                    for n in range(0, 14):
                                                        if n < m or n > m + 1:
                                                            continue
                                                        for o in range(0, 15):
                                                            if o < n or o > n + 1:
                                                                continue
                                                            print(a,b,c,d,e,f,g,h,i,j,k,l,m,n,o)
                                                            t = ll[0][a] + ll[1][b] + ll[2][c] + ll[3][d] + ll[4][e] + ll[5][f] + ll[6][g] + ll[7][h] + ll[8][i] + ll[9][j] + ll[10][k] + ll[11][l] + ll[12][m] + ll[13][n] + ll[14][o]
                                                            if t > ma:
                                                                ma = t
print(ma)
