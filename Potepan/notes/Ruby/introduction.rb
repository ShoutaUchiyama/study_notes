# インスタンス変数
class Introduction
    def initialize(name, age)
        # インスタンス生成時に渡されて名前と年齢をインスタンス変数に保持
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

taro = Introduction.new("Taro", 25)
hana = Introduction.new("Hana", 23)

# call_name呼び出し
taro.call_name()
hana.call_name()

# call_age呼び出し
taro.call_age()
hana.call_age()


# クラス変数
# クラス変数は、クラスとそのインスタンスがスコープになり、クラスのすべてのインスタンスで共有される変数
class Introduction2
    def initialize(name, age)
        # インスタンス生成時に渡された名前と年齢をインスタンス変数に保持
        @@name = name
        @@age = age
    end

    def call_name
        puts "私の名前は#{@@name}です。よろしくお願いいたします！"
    end
end

taro = Introduction2.new("Taro", 25)
hana = Introduction2.new("Hana", 23)

# call_name呼び出し
taro.call_name()
hana.call_name()

# call_age呼び出し
taro.call_age()
hana.call_age()