# モジュールの基本構文
# module モジュール名
#     # モジュール定義
# end

# includeメソッド
# moduleで記載した処理を、対象のクラスの定義の中で混ぜ合わせることをMix-inと呼ぶ
# モジュールの処理をクラスに混ぜる方法の一つにincludeメソッドを使う方法がある。
# class クラス名
#    include モジュール名
# end
# 上記のように記述をすることによって、モジュールで記載した処理（メソッド）を、includeの記述をした
# クラスのインスタンスメソッドとして提供する（扱う）ことができる。

# モジュールを作成する
module CallHello
    def call_hello
        puts "こんにちは！"
    end
end

class Introduction
    # CallHelloモジュールをMix-inしている
    include CallHello

    # このクラスのインスタンスが生成される時に自動で実行されるしょり
    def initialize(name, age)
        @name = name
        @age = age
    end

    def call_name
        puts "私の名前は#{@name}です。よろしくお願いします！"
    end

    def call_age
        puts "#{@age}歳です！"
    end
end

# Introductionクラスのインスタンスを生成
introduction = Introduction.new("Ruby", 25)

# Introductionクラスに混ぜ合わせたモジュールを呼び出す
introduction.call_hello()

introduction.call_name()
introduction.call_age()