result = 0
for x in range(999, 99, -1):
  for y in range(999, 99, -1):
    ans = str(x * y)

    if len(ans) % 2 != 0:
      next

    top = ans[:int(len(ans)/2)]
    bottom = ans[int(len(ans)/2):]
    bottom = ''.join(list(reversed(bottom)))

    if top == bottom:
      if int(ans) > result:
        result = int(ans)
print(result)