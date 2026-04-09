class SuperClass
    # クラス変数を定義する
    @@class_name = "クラス変数"

    def set_name(name)
        # インスタンス変数を定義する
        @instance_name = name
        call()
    end

    def call
        puts "callメソッドで呼び出した[#{@instance_name}]です"
        puts "-------------------"
        puts "callメソッドで呼び出した[#{@@class_name}]です"
        puts "-------------------"
    end
end

class SubClass < SuperClass
    def sub_call
        puts "sub_callメソッドで呼び出した[#{@instance_name}]です"
        puts "-------------------"
        puts "sub_callメソッドで呼び出した[#{@@class_name}]です"
    end
end

super_class = SuperClass.new
super_class.set_name("インスタンス変数")

sub_class = SubClass.new
sub_class.sub_call()