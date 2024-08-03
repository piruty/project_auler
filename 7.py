primes = [2]
prime = 3

while len(primes) < 10001:
  is_prime = True
  for p in primes:
    if prime % p == 0:
      is_prime = False
      break
  if is_prime:
    primes.append(prime)
  prime  += 2
print(primes[-1])
