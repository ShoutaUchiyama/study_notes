# timesメソッド（回数を指定して処理を繰り返す）
# for文（指定した範囲オブジェクトの範囲分処理を繰り返す）
# while文（条件がtrueの間処理を繰り返す）
# util文（条件がfalseの間処理を繰り返す）
# eachメソッド（配列や範囲オブジェクトに含まれている要素を順に取り出す）
# loopメソッド（無限ループ行う）

# timesメソッドの基本構文
count = 5

count.times do
    puts "Rubyで繰り返しを実装"
end

# for文の基本構文
for value in 2..5 do # 2,3,4,5
    puts "ただ今の変数の値は#{value}です。"
end

for value in 2...5 do # 2,3,4
    puts "ただ今の変数の値は#{value}です。"
end

# breakとnext
for count in 1..10 do
    if count == 5
        puts "next文の処理を実行します"
        next
    end
    puts "ただいまは#{count}回目の繰り返し処理です。"
    if count == 8
        puts "break文の処理を実行します"
    end
end
puts "for文の処理を抜けました"

# eachメソッドの基本構文
# 配列を用意する
users = ["munakata", "oyama", "hongou"]
# each文で繰り返しをする
users.each do |user|
    puts "ただいま格納されている値は「#{user}」です"
end

puts "------------"

# ハッシュを用意する
books = {
    "title" => "eachメソッドを使ってみた！",
    "prica" => 3980,
    "page" => 250,
    "release_date" => "2020-09-20"
}

# each文で繰り返しをする
books.each do |key, value| # |キーが格納されている変数, 値が格納される変数|
    puts "キー名は#{key}で、ペアとなっている値は#{value}です"
end