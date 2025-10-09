# Rubyのハッシュについて

# ハッシュ定義の基本構文
# ハッシュ = {"キー１" => 値1, "キー2" => 値2, ...}

# booksハッシュに格納された要素を確認する
books = {
    title: "Rubyでハッシュを学ぼう！",
    company: "プログラミングを学ぶ社",
    page: 321,
    price: 2980
}

# booksハッシュに格納された要素を確認する
p books

# ハッシュにキーを指定して出力をする
puts books[:title]
puts books[:price]

# booksハッシュのキーがtitleのオブジェクトを更新する
books[:title] = "Rubyで配列を作ろう"
# booksハッシュのキーがtitleのオブジェクトを更新する
books[:price] = 3800

# ハッシュにキーを指定して出力する
puts books[:title]
puts books[:price]

# ハッシュの要素の追加と削除
users = {
    name: "Takuya",
    height: 175,
    weight: 60,
    gender: "男"
}

# ハッシュを出力する
p users
puts "----------------"

# usersハッシュに:telで新たにオブジェクトを追加する
users[:tel] = "0801234567"

# ハッシュを出力する
p users
puts "----------------"

# ハッシュを出力する
p users
puts "------------------"

# ハッシュの要素を削除する
users.delete(:weight)

# ハッシュを出力する
p users