module Teach
    def call
        puts "#{self}ではモジュールという機能が使えるのが特徴です"
    end
end

#name変数に文字列オブジェクトを格納する
name = "Ruby"

#name変数の文字列オブジェクトにTeachモジュールの機能を追加する
name.extend(Teach)

#文字列オブジェクトに追加したcallメソッドを実行してみる
name.call()