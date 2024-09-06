function find_recurring_cycle_length(numerator, denominator)
    # 除算過程で現れる余りを記録する辞書
    remainders = Dict()
    # 小数点以下の桁数を数えるカウンター
    decimal_places = 0
    # 初期の余りを計算
    remainder = numerator % denominator

    # 割り切れるか、循環が見つかるまでループ
    while remainder != 0 && !haskey(remainders, remainder)
        # 現在の余りと小数点以下の桁数を記録
        remainders[remainder] = decimal_places
        # 次の桁を計算（余りに10をかけて再度割り算）
        remainder = (remainder * 10) % denominator
        # 小数点以下の桁数を増やす
        decimal_places += 1
    end

    # 結果の返却
    # 割り切れた場合（余りが0）は循環なしとして0を返す
    # それ以外の場合、循環の長さを計算して返す
    return remainder == 0 ? 0 : decimal_places - remainders[remainder]
end

function find_longest_recurring_cycle(limit)
  max_length = 0
  max_d = 0

  for d in 1:limit-1
    length = find_recurring_cycle_length(1, d)
    if length > max_length
      max_length = length
      max_d = d
    end
  end

  return max_d, max_length
end

limit = 1000
result, cycle_length = find_longest_recurring_cycle(limit)
println(result)
println(cycle_length)
