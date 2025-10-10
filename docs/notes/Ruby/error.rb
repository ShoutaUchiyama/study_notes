# 例外処理
# number = 100 + nil # 数値にnilは足すことが出来ないため例外（エラー）となる
# puts number
# puts "処理が最後まで実行されました。"

# error.rb:2:in `+': nil can't be coerced into Integer (TypeError)

begin
    number = 100 + nil # 数値にnilは足すことができないため例外（エラー）となる
    puts number
rescue
    puts $! # 例外オブジェクトを出力する。
    puts $@ # 例外が発生した位置情報を出力する
    puts "例外が発生したのでrescue文の処理が通っています。"
end

puts "処理が最後まで実行されました。"
