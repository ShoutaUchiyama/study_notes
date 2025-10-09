# if文の基本構文
number1 = 300
number2 = 100

puts "================================================"

if number1 > number2
    number1 = number1.to_s
    number2 = number2.to_s
    puts number1 + "は" + number2 + "より大きいです！"
elsif number1 == number2
    number1 = number1.to_s
    number2 = number2.to_s
    puts number1 + "は" + number2 + "と同じです"
else
    number1 = number1.to_s
    number2 = number2.to_s
    puts number1 + "は" + number2 + "より小さいです"
end

puts "================================================"

case_pattern = "" #case文での比較するオブジェクトの変数を用意する

number1 = 500
number2 = 1000
if number1 > number2
    case_pattern = "パターンA"
elsif number1 == number2
    case_pattern = "パターンB"
else
    case_pattern = "パターンC"
end

# ここで数値オブジェクトを文字列オブジェクトに変換する
number1 = number1.to_s
number2 = number2.to_s

case case_pattern
when "パターンA"
    puts "パターンAでの処理を通ります。"
    puts number1 + "は" + number2 + "と同じです"
when "パターンB"
    puts "パターンBでの処理を通ります。"
    puts number1 + "は" + number2 + "と同じです"
when "パターンC"
    puts "パターンCでの処理を通ります。"
    puts number1 + "は" + number2 + "より小さいです"
else
    puts "どのパターンに当てはまりません"
end