# オブジェクト指向

# クラスの定義
class Introduction
    def initialize(name, age)
        @name = name
        @age = age
    end

    def call_name
        puts "私の名前は#{@name}です。よろしくお願いいたします！"
    end

    def call_age
        puts "#{@age}歳です！"
    end
end

# newメソッドの呼び出し
taro = Introduction.new("Taro", 25)
taro.call_name()
taro.call_age()

