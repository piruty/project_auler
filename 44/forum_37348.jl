# https://projecteuler.net/thread=44;page=5#37348

function PE044(c=1)
  i = D = 0

  while c > 0
    D += 3 * i + 1
    i += 1
    Pd = 0

    for d in range(1:i)
      Pd += 3d - 2
      j = div(D - Pd, 3d)
      r = rem(D - Pd, 3d)
      if r > 0 && (1 + sqrt(1 + 24 * (j * (3 * j - 1)))) % 6
        print(D)
        c -= 1
      end
    end
  end
end

println(PE044(100))