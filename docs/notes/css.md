# CSS 基本文法

**CSSの基本構文**
```
セレクタ {
      プロパティ: 設定値;
      プロパティ: 設定値;
      プロパティ: 設定値;
}
```

**CSSファイルに記述する**
サンプルコード
index.html
```
<!DOCTYPE html>
<html>
  <head>
    <title>タイトル</title>
    # ここが重要
    <link rel="stylesheet" href="style.css">
  </head>

  <body>
    <div>
      <p>こんにちは</p>
    </div>
  </body>
</html>
```

style.css
```
div {
  color: red;
  font-size: 16px;
  padding: 12px;
}
```

---

**セレクタの種類**
| セレクタ | 基本構文 | HTMLでの記述例 | CSSでの記述例 | 設定方法
|:---|:--|:--|:--|:--|
| id | #セレクタ { <br> プロパティ:設定値; <br>} | `<div id="sample"></div>`| #sample { <br> color: red; <br>} | `#`をつける
| class       | .セレクタ { <br> プロパティ:設定値; <br>} | `<div class="sample"></div>` | .sample { <br> color: red;} | `.`をつける
| 要素（=タグ）| セレクタ { <br> プロパティ:設定値; <br>} | `<div>`※タグそのものをセレクタとして扱える | div { <br> color: red;<br> } |タグ名で指定する

**基本的にはclass属性をセレクタとする**
- id属性は、1ページに1つのHTMLタグにしか設定できない。
- 要素でセレクタを設定すると、影響範囲が広くなってしまう。

`id`属性は、1ページにつき1つまでしか設定できず、仮に2つ以上設定した場合には、いずれかのid属性のみ有効なものとしてみなされる。この点、`class`属性にはそのような制限はないため、複数のHTMLタグへ同じclassを設定し、それらに対して共通のスタイルを適用することが可能。`id`属性を複数箇所に設定してもすぐにエラーが発生するわけではないが、意図しない挙動になる可能性が高いため、id属性をセレクタとして設定するのはできるだけ避ける。

---
**プロパティの優先度について**
1.`id`属性
2.`class`属性
3.要素型

---
**プロパティの優先度まとめ**
| 優先度 | 設定方法 | 記述例 |
| :-- | :-- | :-- |
| 1 | `!important`記法 | .sample { <br> &nbsp;color: red !important; <br>} |
| 2 | インラインスタイル | `<div style="color:red;"></div>`|
| 3 | `id`セレクタ | #sample { <br> &nbsp;color:red; <br>} |
| 4 | `class`セレクタ/疑似セレクタ | .sample { <br> &nbsp;color: red; <br>} <br><br> .sample:hover { <br> &nbsp;color: red; <br> } |
| 5 | 要素型セレクタ/疑似要素 | div { <br> &nbsp;color:red; <br>} <br><br> div:before { <br> &nbsp;color:red; <br>} |
| 6 | 記述順序が後ろのプロパティ | .sample { <br> &nbsp;color:red; <br>}<br><br>.sample { <br> &nbsp;color:blue;<br>} <br><br>※優先度が同じ場合、後ろに記述したプロパティ（ここでは`color: blue;`）が優先される。

---
**実際の使用例**
**1.ナビゲーションメニューのスタイリング**
Webサイトのナビゲーションメニューにスタイルを適用する。リスト要素を使ってメニューを作成し、クラスセレクタを使ってスタイルを適用する。
```
<ul class="navigation">
  <li><a href="#home">Home</a></li>
  <li><a href="#about">About</a></li>
  <li><a href="#contact">Contact</a></li>
</ul>
```
```
.navigation {
  list-style-type: none;
  margin: 0;
  padding: 0;
}

.navigation li {
  display: inline;
  margin-right: 10px;
}
.navigation a {
  text-decoration: none;
  color: black;
}
```

**2.特定セクションの協調**
IDセレクタを使って特定のセクションを強調する。例えば、特別なオファーのセクションに特別なスタイルを適用する場合。
```
<div id="special-offer">
  <h2>今月の特別オファー</h2>
  <p>限定商品を特別価格でご提供！</p>
</div>
```
```
#special-offer {
  background-color: yellow;
  padding: 20px;
  border-radius: 5px;
}

#special-offer h2 {
  color: red;
}
```

**3.フォーム要素のカスタマイズ**
フォーム内の要素に異なるスタイルを適用する。例えば、入力欄と送信ボタンに異なるスタイルを適用する場合。
```
<form>
  <input type="text" class="input-field">
  <button type="submit" class="submit-button">送信</button>
</form>
```
```
.input-field {
  border: 1px solid #ddd;
  margin-bottom: 10px;
  padding: 8px 15px;
  width: 200px;
}

.submit-button {
  background-color: blue;
  color: white;
  border: none;
  padding: 10px 15px;
  cursor: pointer;
}
```

---
**半透明にするならRGBAカラーモデル**
- R(Red):赤の強度を0から255の範囲で指定する。
- G(Green):緑の強度を0から255の範囲で指定する。
- B(Blue):青の強度を0から255の範囲で指定する。
- A(Alpha):透明度を0.0（完全透明）から1.0（完全不透明）の範囲で指定する。

**RGBAの使い方**
```
.sample {
  /* 背景色を半透明の赤に設定 */
  background-color: rgba(255, 0, 0, 0.5);

  /* テキストの色を半透明の青に設定 */
  color: rgba(0, 0, 255, 0.5);
}
```
