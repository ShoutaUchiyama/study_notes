# ルーティング
ルーティングとはRailsでの実行する処理を示す経路のことを示す。
ルーティングという名前の通りプログラムの処理のルートに還啓する。
RailsのルーティングではどのURLでアクセスされたかによって実行する
コントローラを選定しMVC構造での処理の流れを決めることができる
大切な設定。

```routes.rb:ruby
Rails.application.routes.draw do
    get `lessons/hello`
    # For details on the DSL available within this file. see https://guides.rubyonrails.org/routing.html
end
```

**ルーティングの設定ファイルの書き方**
リクエストメソッド `リクエストURL`, to: `コントローラ名#アクション名`

**ルーティングを設定する基本の流れ**
①リクエストメソッドを決める（getやpostなど）
②処理を実行する目zる氏となるリクエストURLを設定する
③リクエストURLの後に`to:`を半角スペースを開けて記述する
④`to:`の後に実行したいコントローラとアクション名を`#`を使って設定する