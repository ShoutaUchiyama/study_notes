# Html 基本文法

**SEOとは**
SEO（Search Engine Optimization）検索エンジン最適化の略。Googleなどの検索エンジンでウェブサイトが検索結果の上位に表示されるように、サイトの構造やコンテンツを調整する活動全般を指す。

---
**タグの基本文法**
`<a>タグはWebページ内でリンクを設定する際に使用する。</a>`
【基本構文】
`<a href="実際のリンク">リンクにしたいテキスト</a>`

【画像にリンクを設定する際の書き方】
`<a href="実際のリンク"><img src="画像のパス" alt="代替えテキスト"></a>`

【リンクを別タブで開く方法】
`<a href="実際のリンク" target="_blank" rel="noopener noreferrer">別タブで開くリンク</a>`
ページ遷移先として外部のサイトを設定する際には少し注意が必要で、
rel="noopener noreferrer設定がない場合では、別タブで開いた外部サイト上に万が一悪意のあるプログラムが作成されている場合に、元々のサイト（リンクを作成したサイト）がそのプログラムに操作されてしまう場合がある。
この脆弱性を防ぐために、** 別タブでページを開く際には、rel="noopener noreferrer設定を忘れないようにする。 **

---
**`<img>`タグにはalt属性を設定する。**
alt属性を使用すると、パスの誤りなどで画像が表示されない場合に、代わりにその画像の説明を表示することが可能になる。
alt属性は検索エンジンへの補足説明としても有効。SEO観点でも設定は必須。

---
**`<table>`タグは表を作成するときに使用する。**
`<tr>・・・表の行を示すタグ。<tr>~</tr>の数だけ表の行が作成される。`
`<th>・・・表の見出し（項目）を示すタグ。`
`<td>・・・表のデータ（値）を示すタグ。`
表で使えるデザイン
枠線     `<table border></table>`
中央揃え `<tr align="center"></tr>`

cssで余白を設定。（例）
`table th {
      padding: 15px 25px;
    }

    table td {
      padding: 10px 20px;
    }
`
---
**`<form>`/`<input>`タグはユーザーにテキスト入力や要素を選択してもらう場合に使用するタグ。**
`<form>`タグで入力フォームとする箇所全体を囲い、その中に`<input>`タグを配置するだけで入力フォームが作成される。`<input>`タグは終了タグは不要。
`<input>`タグのtype属性
text：テキストタイプの入力欄が表示される。
password：パスワードの入力欄が表示される。
file：ファイルをアップロードするためのボタンが表示される。
radio：ラジオボタンが表示される。
checkbox：チェックボックスが表示される。
reset：同じformタグ内の入力内容をクリアするためのりせっとボタンが表示される。
submit：同じformタグ内の入力内容を送信するためのボタンが表示される。

`<input>`タグの便利な属性
1.name属性：フォームを通じて送信されるデータを識別するためのキーとして機能する。
例）
`<form action="送信先のURL">`
      `<input type="text" name="username">`
      `<input type="password" name="password">`
`</form>`

2.placeholder属性：入力フォームの記入例を表示する。
例）
`<form action="送信先のURL">`
      `<input type="text" placeholder="記入例を書きます">`
`</form>`

3.accept属性：アップロードできるファイルの種類を指定することができる。
例）
`<form action="送信先のURL">`
      `<input type="file" accept="image/png, image/jpeg">`
`</form>`

---
***`<label>`タグは設定した`<input>`タグにラベルを設定するために使用され、入力フォームをより見やすく整理する。***
必須機能ではないが、一般的な入力フォームには設定が推奨される。

`<label>`タグの書き方1
`<form action="送信先のURL">`
      `<label>`
        メールアドレス`<input type="email">`
      `</label>`
`</form>`

`<label>`タグの書き方2
`<label>`タグのfor属性を使って任意の`<input>`タグを紐づける方法。
for属性と対応する値を`<input>`タグのid属性に設定する必要がある。
2つの方法で優劣は特にないが、一般的にこちらの方法が採用されることが多い。
`<form action="送信先のURL">`
      `<label for="email">メールアドレス</label>`
      `<input type="email" id="email">`
`</form>`

***`<label>`タグを使用するメリット***
`<label>`タグを使用すると、`<label>`タグをクリックするだけで、そこに紐づいた入力フォームにフォーカスを当てることができる。
また、チェックボックスやラジオボタンの場合、ボタンが小さくなりがちだが、その場合も`<label>`タグをクリックすることで任意の選択しを選択することができる。

**`<textarea>`タグとは**
このタグは、ユーザーからのフィードバック、コメント、その他のテキストベースの入力を受け取る際によく使用される。
`<textarea>`タグの書き方その１
placeholder属性を使用して、ガイドテキストを表示する。
`<textarea placeholder="ここにコメントを入力"></textarea>`

`<textarea>`タグの書き方その２
name属性を追加して、フォーム送信時の識別子を設定する。
`<textarea name="comment"></textarea>`

`<textarea>`タグの書き方その３
rowsとcols属性を使用して、`<textarea>`のサイズを指定する。

**■サンプルコード**
```html
<form action="sample_url">
  <div>
    <label for="name">名前：</label>
    <input type="text">
  </div>

  <div>
    <label for="email">メールアドレス：</label>
    <input type="email">
  </div>

  <div>
    <label for="password">設定するパスワード：</label>
    <input type="password">
  </div>

  <div>
    <p>性別：</p>
    <label>
      男<input type="radio" name="sex">
    </label>
    <label>
      女<input type="radio" name="sex">
    </label>
  </div>

  <div>
    <p>話せる言葉(複数選択可)：</p>
    <label>
      <input type="checkbox" name="language" value="japanese">日本語
    </label>
    <label>
      <input type="checkbox" name="language" value="english">英語
    </label>
    <label>
      <input type="checkbox" name="language" value="chinese">中国語
    </label>
    <label>
      <input type="checkbox" name="language" value="french">フランス語
    </label>
    <label>
      <input type="checkbox" name="language" value="italian">イタリア語
    </label>
  </div>

  <div>
    <label>入力項目をクリア</label>
    <input type="reset">
  </div>

  <div>
    <label>入力内容を送信する</label>
    <input type="submit">
  </div>
</form>
```


