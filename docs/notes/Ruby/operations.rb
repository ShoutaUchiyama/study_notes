# 四則演算の基本構文
# 左辺の数値 演算子 右辺の数値

puts 20 + 10
puts 20 - 10
puts 20 * 10
puts 20 / 8
puts 20 % 8

# 文字列の連結
# 文字列 + 文字列
puts "おはよう" + "ございます"

# 文字を変数に格納し連結
str1 = "今日は"
str2 = "プログラミング日和ですね"

puts str1 + str2

# 文字列の連結で活躍するメソッド
# to_sメソッド:数値オブジェクトを文字列オブジェクトに変換する
# to_iメソッド:数字の文字列オブジェクトを数値オブジェクトに変換する

number = 100
p number

# number変数に文字列オブジェクトに変換をして自身に代入をし直す
number = number.to_s
p number
puts "Rubyは" + number + "点です。"

# number変数に数値オブジェクトに変換をして自身に代入をし直す
number = number.to_i
p number

# 変数展開
# "#{変数名}"
puts "----------------------"
puts "変数展開"
number1 = 100
number2 = 200

number1 = number1.to_s
puts "+を使って文字列を連結"
p "Rubyは" + number1 + "点ですよね！"

puts "--------------------"

puts "変数展開を使用"
p "Rubyは#{number2}点ですよね！"

puts "-----------------------"

puts "変数展開の中では数値の計算も可能！"
p "Rubyは#{number2 + 100}点ですよね！"
