# 配列
# 配列名（変数名） = [要素1, 要素2, 要素3…]
animals = ["パンダ", "コアラ", "カンガルー"]

animals[1] = "キリン"

# animals配列を定義する
    animals = ["パンダ", "コアラ", "カンガルー"]

    puts animals[0]
    puts animals[1]
    puts animals[2]

    puts "---------------"
    # インデックスが1のオブジェクトを更新する
    animals[1] = "キリン"

    puts animals[0]
    puts animals[1]
    puts animals[2]

# 配列に新しく要素を追加する
# <<を使う
# pushを使う
animals2 = ["パンダ", "コアラ", "カンガルー"]
animals2.push("ライオン")

# 配列の要素を削除する
# 配列名.delete_at(削除する要素のインデックス)
animals3 = ["パンダ", "コアラ", "カンガルー"]
animals3 << "ライオン"

p animals3

animals3.push("シマウマ")

p animals3

animals3.delete_at(0)

p animals3