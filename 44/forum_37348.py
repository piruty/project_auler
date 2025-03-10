import math

def PE044(c=1): # c : how many wants you ?
  i = D = 0
  while c:
    D+=3*i+1 ; i+=1 ; Pd = 0
    for d in range(1, i):
      Pd += 3*d-2
      j, r = divmod(D-Pd, 3*d)
      if (not r) and not (1+math.sqrt(1+24*(j*(3*j-1)+D)))%6:
        print(D)
        c-=1

print(PE044(10000))