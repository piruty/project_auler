# ユークリッドの互除法を使って最小公倍数を求める
def koubai(a, b):
  x = a * b

  if a < b:
    a, b = b, a

  r = a % b
  while r != 0:
    a, b = b, r
    r = a % b
  return x / b

result = 1
for x in range(2,20):
  result = koubai(result, x)

print(result)
