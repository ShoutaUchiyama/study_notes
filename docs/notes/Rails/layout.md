## レイアウト

Webサイトではナビゲーションやフッターなどサイト内で、どの画面でも同じように表示したい箇所がある。
すべてのビューファイルに対してHTMLで全て記述するのは大変なので、
Railsでは共通で表示する箇所のHTMLはlayoutsというテンプレートでHTMLを共通で使用できる方法が存在する。

`application.html.erb`がviewsフォルダ内に用意されている。

```ruby
<!DOCTYPE html>
<html>
  <head>
    <title><%= content_for(:title) || "Myapp" %></title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <%= csrf_meta_tags %>
    <%= csp_meta_tag %>

    <%= yield :head %>

    <link rel="manifest" href="/manifest.json">
    <link rel="icon" href="/icon.png" type="image/png">
    <link rel="icon" href="/icon.svg" type="image/svg+xml">
    <link rel="apple-touch-icon" href="/icon.png">
    <%= stylesheet_link_tag "application", "data-turbo-track": "reload" %>
  </head>

  <body>
    <%= yield %>
  </body>
</html>
```

この中で特別な記述は以下のコード
```
<%= yield %>
```

call.html.erbのファイルで、以下のようにコードを書いていた
```html
<h1>callアクションで表示されるページです</h1>
<p><%= @call %></p>
```

call.html.erbのファイルのHTMLのコードは`layouts`フォルダの
`application.html.erb`の<%= yield %>の中に埋め込まれていた。
これが`layouts`フォルダの機能。