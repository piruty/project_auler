# エラトステネスの篩

def sieve_of_eratosthenes(limit):
    prime = [True for _ in range(limit + 1)]
    p = 2

    while p * p <= limit:
        if prime[p]:
            for i in range(p * p, limit + 1, p):
                prime[i] = False
        p += 1

    return [p for p in range(2, limit) if prime[p]]

print(sieve_of_eratosthenes(20))
