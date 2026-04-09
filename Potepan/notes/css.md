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

---
**fontプロパティ**
プロパティ一覧
・color：文字色
・font-family：フォント
・font-size：大きさ
・font-weight：太さ
・font-style：書体

---
**text-alignプロパティとは？**
`text-align`プロパティを使用すると、文字の表示位置を設定することができる。

text-alignプロパティの設定値
・left：文字を左揃えにする
・right：文字を右揃えにする
・center：文字を中央揃えにする

---
**ブロック要素/インライン要素とは**
**ブロック要素**
`<h1>`タグや`<p>`タグなどを構成する要素で、ブラウザ上ではその要素の前後に<u>改行が含まれる</u>。
ブロック要素の例
```
<h1>~<h6>、<p>、<div>、<ul>、<li>、<table> など
```

**ブロック要素の特徴**
・横幅の初期値は親要素と同じ値になる
・横幅（width）と高さ（height）が指定できる
・他の要素と縦に並ぶ

---
**インライン要素とは**
インライン要素は、多くの場合ブロック要素の内部の要素として用いられ、文章の中の一部の要素として使われることが多い。ブロック要素とは違って、その要素の前後に<u>改行が含まれない</u>。
インライン要素の例
```
<a>、<span>、<strong>、<img>、<input>、<textarea>、<select> など
```

**インライン要素の特徴**
・横幅（width）と高さ（height）は指定できない
・開始タグと終了タグで囲まれた内容（コンテンツ）によってい横幅の初期値が設定される
・他の要素と横に並ぶ

---
**ブロック要素サンプル**
```
<h1>h1タグはブロック要素です</h1>
<p>pタグはブロック要素です</p>
<ul>
  <li>liタグはブロック要素です</li>
  <li>liタグはブロック要素です</li>
</ul>
```
表示結果
```
h1タグはブロック要素です
pタグはブロック要素です

・liタグはブロック要素です
・liタグはブロック要素です
```

---
**インライン要素サンプル**
```
<a href="#">aタグはインライン要素です</a>
<span>spanタグはインライン要素です</span>
<strong>strongタグはインライン要素です</strong>
```
表示結果
```
aタグはインライン要素です spanタグはインライン要素です strongタグはインライン要素です
```
---
**text-alignプロパティの基本的な使い方**
<u>ブロック要素では使用できるが、インライン要素では機能しない。</u>
text-alignプロパティがうまく聞かない場合、大抵はこの問題（インライン要素になってしまっている）であることが多い。

---
**borderプロパティ**
`border`プロパティを使用すると、設定した要素の枠線を表示することができる。

【基本構文】
```
セレクタ {
  border: 枠線の太さ 枠線の種類 枠線の色;
}
```
「枠線の太さ」は基本的に`px`単位で設定し、「枠線の色」はカラーコードで学んだコードを設定する。

**borderプロパティの枠線の設定値**
| 設定値 | 役割 |
| :-- | :-- |
| solid  | 一本の直線を表示する         |
| double  | 二本の直線を表示する        |
| groove  | 立体的に窪んだ線を表示する   |
| gotted  | 点線を表示する              |
| dashed  | 破線を表示する              |
| ridge  | 立体的に隆起した線を表示する  |

---
**borderプロパティの様々な設定方法**
上下左右で個別の枠線を設定することができる。

**borderプロパティの設定値**
| プロパティ | 役割 |
| :-- | :-- |
| border | 要素の上下左右の枠線をまとめて設定する。 |
| border-top | 要素の上の枠線のみ設定する。 |
| border-right | 要素の右の枠線のみ設定する。 |
| border-bottom | 要素の下の枠線のみ設定する。 |
| border-left   | 要素の左の枠線のみ設定する。 |

---
**枠線の「太さ」「種類」「色」を個別で設定する方法**
**個別のプロパティを使った実装例**
```
セレクタ {
  border-width: 枠線の太さ;
  border-style: 枠線の種類;
  border-color: 枠線の色;
}
```
上記の通り、`border`プロパティでまとめて設定しているものをそれぞれ分解する形になる。

---
**borderプロパティの基本的な使い方**

index.html
```
<h3>要素の左に枠線を表示しています。</h3>
<p>上下左右に枠線を表示しています。</p>
```
style.css
```
h3 {
  border-left: 4px solid #ff9800;
}

p {
  border: 2px solid #ff9800;
}
```

---
**marginプロパティ**
設定した要素の外側に余白が設定される。

**marginプロパティの設定値**
margin：要素の上下左右の余白をまとめて設定する。
margin-top：要素の上の余白のみ設定する。
margin-bottom：要素の下の余白のみ設定する。
margin-left：要素の左の余白のみ設定する。

---
**paddingプロパティ**
設定した要素の内側に余白が設定される。
marginプロパティとは違って、他の要素とは関係なく、自分自身の余白のみを設定するプロパティになる。

**paddingプロパティの設定値**
padding：要素内の上下左右の余白をまとめて設定する。
padding-top：要素内の上側の余白のみ設定する。
padding-right：要素内の右側の余白のみ設定する。
padding-bottom：要素内の下側の余白のみ設定する。
padding-left：要素内の左側の余白のみ設定する。

---
**margin/paddingを使うときのテクニック**
**「上下」「左右」でそれぞれ共通の余白を設定する方法**
```
.padding {
  padding: 20px 40px; /* 最初に上下の余白、2番目に左右の余白を設定する */
}
```

**「上」「左右」「下」でそれぞれ余白を設定する方法**
```
.padding {
  padding: 20px 30px 40px; /* 最初に上の余白、2番目に左右の余白、3番目に下の余白を設定する */
}
```

**「上」「右」「下」「左」でそれぞれ余白を設定する方法**
```
.padding {
  padding: 10px 20px 30px 40px; /* 最初に上の余白、2番目に右の余白、3番目に下の余白、4番目に左の余白を設定する*/
}
```

---
**marginにautoを設定する**
marginプロパティには、pxでの設定方法の他に、`auto`という値も用意されている。`auto`を活用することで、ブロック要素を中央揃えにすることができるようになる。

---
**widthプロパティ**
`width`(ウィドゥス)プロパティを使用すると、ブロック要素の横幅を指定することができる。

**widthプロパティの設定値**
- auto：ブロック要素の場合、親要素の横幅が設定される。インライン要素の場合、コンテンツ分の横幅が設定される。※初期値として設定されているため、明示的に設定する必要はない。
- 〇〇px：親要素の横幅に関係なく、絶対的に横幅を設定することができる。
- 〇〇%：親要素の横幅を対象として、相対的に横幅を設定することができる。※例えば、親要素が200pxで子要素のwidthを50%と設定した場合、子要素の横幅は100pxとなる。

---
**heightプロパティ**
`height`(ハイト)プロパティを使用すると、ブロック要素の高さを指定することができる。設定値は`width`プロパティを同じ。

---
**widht/heightプロパティを使うときの注意点**
- 親要素を超える横幅/高さを設定しないこと。
設定値が`auto`や`%`であれば発生しないが、`px`で設定すると、子要素が親要素を超えてしまう場合がある。

- `height`プロパティは固定しないこと。
`height`プロパティを`px`で固定してしまうと、コンテンツの文字数が多くなった際に枠をはみだしてしまうことがある。

---
**positonプロパティ**
`positon`プロパティを使用すると、設定した要素の位置を自由に設定することができる。例えば、「親要素の右上に要素を配置したい」や「ヘッダーを画面上部に固定したい」などの設定も可能になる。

**positionプロパティの設定値**
- static：初期値として設定されている。特に画面上での変化は起きない。
- absolute：親要素を基準にして、絶対的な配置箇所を決める。
- relative：本来の表示位置を基準にして、相対的な配置箇所を決める。
- fixed：画面上の特定の位置に固定する。

**top/right/bottom/leftプロパティとは**
postionプロパティは、セットで覚えておくべきプロパティが`top`/`right`/`bottom`/`left`プロパティ。`positon`プロパティは<u>「どのように配置するか」</u>を決めるプロパティで、`top`/`right`/`bottom`/`left`プロパティは<u>「基準地点からどの程度移動させるか」</u>を設定するもの。

---
**positionプロパティの基本的な使い方**
**absoluteを使ったケース**
```
index.html
<div class="parent">
  <p class="child top-0 left-0">左上に配置</p>
  <p class="child top-0 right-0">右上に配置</p>
  <p class="child right-0 bottom-0">右下に配置</p>
  <p class="child bottom-0 left-0">左下に配置</p>
  <p class="child top-75 left-50">上から75px、左から50pxに配置</p>
</div>
```
```
style.css
.parent {
  position: relative;
  height: 200px;
}

.child {
  position: absolute;
}

.top-0 {
  top: 0;
}

.top-75 {
  top: 75px;
}

.right-0 {
  right: 0;
}

.bottom-0 {
  bottom: 0;
}

.left-0 {
  left: 0;
}

.left-50 {
  left: 50px;
}
```

---
**relativeを使ったケース**
```
index.html
<p>何も設定していません</p>
<p class="relative top-40 left-30">本来の表示位置と比べて、上から40px、左から30pxの位置に配置</p>
```
```
style.css
.relative {
  position: relative;
}

.top-40 {
  top: 40px;
}

.left-30 {
  left: 30px;
}
```

---
**fixedを使ったケース**
実際、ページ上部からスクロールしていくと、通常であればメニューは隠れてしまうが、`fixed`を設定することによって画面上部に固定され、どこまでスクロールしてもメニューが追随する。
このように、`fixed`は、ユーザーのスクロールなどに関わらず常に画面に表示しておきたい要素（グローバルメニューやサイドバーなど）に対して設定することがほとんでで、それによってUXの向上にも寄与している。

---
**displayプロパティ**
`display`プロパティを使用すると、設定した要素の表示形式を変更することができる。HTMLのタグの多くは、「ブロック要素」か
「インライン要素」に分けられ、それによって、ブラウザ上での表示形式が変わったり、適用可能なCSSプロパティが変わったりする。
`display`プロパティを設定すると、<u>ブロック要素をインライン要素に変更したり、逆にインライン要素をブロック要素に変更したりすることが可能になる。</u>

**ブロック要素とインライン要素の違い**
| 比較対象 | ブロック要素 | インライン要素 |
| :-- | :-- | :-- |
| `width`/`height`プロパティの設定 | できる |できない
| `margin`/`padding`プロパティの設定 | いずれも上下左右を設定できる | `margin`は左右のみ設定できる<br>`padding`は上下左右を設定できる
| タグの例 | h1~h6, p, div, ul, li, tableなど | a, span, strong, img, inpt, textarea, selectなど|

**displayプロパティの設定値**
- inline：インライン要素に設定する
- block：ブロック要素に設定する
- inline-block：インラインブロック要素にする
- none：要素を非表示にする

---
**インラインブロック要素の特徴**
- width/heightで横幅/高さを設定できる
- margin/paddingで余白を設定できる
- 横幅の初期値は内容（コンテンツ）によって設定される
- 他の要素と横に並ぶ
このように、インライン要素では横幅や高さ、余白の設定ができないが、インラインブロック要素ではその点がカバーされる。

**サンプルコード**
```
index.html
<span>通常のspanタグ（インライン要素）</span>
<span class="inline-block">インラインブロック要素に変更</span>
<span class="block">ブロック要素に変更</span>
```
```
style.css
.inline-block {
  display: inline-block; /* インラインブロック要素へ変更 */
  margin-bottom: 10px;
  margin-left: 10px;
  padding: 0 10px;
}

.block {
  display: block; /* ブロック要素へ変更 */
}

/* 見やすくするために記載してます */
span{
  background-color: aqua;
  color: white;
}
```
※通常、spanタグをブロック要素に変更することはない。その場合はpタグを使用する。

**FlexBox**
「FlexBox」は、要素を横並びや縦並びに綺麗に整列させる際に便利な、CSSのレイアウト手法の一つ。※FlexBox自体はプロパティではない。

FlexBoxを使用する際には、まず親要素の`display`プロパティを`flex`に設定する。そうすることで、「この親要素にはFlexBoxを適用する」と宣言することができ、その子要素を綺麗に整列させることができるようになる。

**FlexBoxの基本的な使い方**
```
index.html
<div class="parent">
  <p>子要素</p>
  <p>子要素</p>
  <p>子要素</p>
</div>
```
```
style.css
.parent {
  display: flex;
  justify-content: space-between; /* 子要素を均等に横配置する設定 */
}
```

**FlexBoxの便利なプロパティ**
| プロパティ | 役割 | 設定値 |
| :-- | :-- | :-- |
| justify-content | 子要素の水平方向の配置を設定する | `center`,`start`, `space-between`, `space-around`など
| align-items | 子要素の垂直方向の配置を設定する | `center`, `start`, `end`など |
| flex-direction | 子要素の並び方を設定する | `row`, `row-reverse` , `column`, `column-reverse`など |
| order | 子要素の並び順を設定する | `1`, `2`, `3`など |
| align-content | 複数行になったときの行揃え | `stretch`, `flex-start`, `flex-end`, `center`, `space-between`, `space-around` |
| flex-wrap | 折り返しの有無 | `nowrap`, `wrap`, `wrap-reverse`など |

---
**justify-contentプロパティの設定値**
center：子要素を中央に寄せる
start：子要素を先頭に寄せる
space-between：子要素を均等に配置する※最初の子要素は先頭、最後の子要素は末尾に寄せられる
space-around：子要素を均等に配置する

---
**align-itemsプロパティ**
center：子要素を中央に寄せる
start：子要素を先頭に寄せる
end：子要素を末尾に寄せる

---
**flex-directionプロパティ**
row：子要素を横方向に配置する
row-reverse：子要素を逆順で横方向に配置する
column：子要素を縦方向に配置する

---
**z-index**
`z-index`プロパティを使用すると、要素の重なり順を指定することができる。
`position`プロパティを`absolute`や`fixed`に設定している場合に使用することが多く、設定値が大きいほうが上に表示される。
例えば、Webサイトによくある機能として、画面がスクロールしてもヘッダーが他のコンテンツに隠れることなく表示されるものがあるが、あの機能も`z-index`プロパティで実現可能。

【基本構文】
```
セレクタ {
  z-index: 数字で指定; /* 複数のセレクタに設定した場合、数字の大きい方が上に表示される */
}
```
`z-index`プロパティは、その値に数字を設定する。複数の要素に`z-index`プロパティを設定した場合、数字が大きい要素ほど重なりの上に表示される。つまり、「`1`」と「`10`」を指定した場合は「`10`」を指定した要素が、重なりの上に表示される。
なお、設定値が同じ場合は、コード上でより後ろに記載されている要素が上に表示される。また数字の上限は実質なく、マイナス値も指定できる。値を設定しない場合（=z-indexプロパティを使わない場合）は`0`とみなされる。

**疑似クラス**
「疑似クラス」とは、HTML要素に対して、その要素が特定の状態である場合にスタイルを適用するための技術。「指定した要素にカーソルを当てた場合」や「ボタンをクリックした場合」のスタイルの変化を定義することができるようになる。

【基本構文】
```
セレクタ:擬似クラス {
  プロパティ: 設定値;
}
```

**疑似クラスの設定値と役割**
hover：要素にカーソルが当たった時のスタイルを定義する。
disabled：要素が無効状態（入力不可 など）の時のスタイルを定義する。
first-child：最初の子要素のスタイルを定義する。
nth-child(n)：指定した順番の子要素のスタイルを定義する。

**疑似クラスの基本的な使い方**
**hover**
`hover`を設定すると、要素にカーソルが当たった時のスタイルを設定することができる。

```
index.html
<p class="font-color">カーソルを当てると文字の色が変わります。</p>
<p class="font-style">カーソルを当てると文字の形式が変わります。</p>
```
```
style.css
.font-color:hover {
  color: red;
}

.font-style:hover {
  font-style: italic;
}
```

---
**disabled**
`disabled`を設定すると、要素が無効状態の時のスタイルを設定することができる。「無効状態」とは、例えば、必須項目が入力されておらず「クリック不可」となっているボタンがその状態。
```
index.html
<button type="submit">クリック可能</button>
<button type="submit" disabled>クリック不可</button>
```
```
style.css
button:disabled {
  background-color: rgba(239, 239, 239, 0.3);
  border-color: rgba(118, 118, 118, 0.3);
  color: rgba(16, 16, 16, 0.3);
}
```
---
**first-child**
`first-child`を設定すると、兄弟要素のグループの中で、最初の要素にのみスタイルを適用することができる。
この`first-child`は`<ul>`/`<li>`タグと併用されることが多い。これとは逆に最後の要素にのみスタイルを適用する「`last-child`」もある。

---
**nth-child(n)**
`first-child`は最初の要素にスタイルを適用したが、`nth-child(n)`を設定すると、引数の`n`設定した順番の要素にのみスタイルを適用することができる。


---
**疑似要素**
「疑似要素」はHTML要素の一部の要素を指し、このセレクタに対して疑似要素を指定することで、その一部にスタイルを適用することができる。
要は「要素の最初の一文字」や「要素の最初の1行」のスタイルを設定することができるようになる。
使い方はセレクタに対して`::`（コロン）を付けることで、そのセレクタの疑似要素を定義することができる。

【基本構文】
```
セレクタ::擬似要素 {
  プロパティ: 設定値;
}
```

**疑似要素の設定値と役割**
first-letter：要素に最初の1文字のスタイルを定義する。
first-line：要素が最初の1行のスタイルを定義する。
before：設定した要素の前にコンテンツを挿入する。
after：設定した要素の後ろにコンテンツを挿入する。

---
**first-letter**
`first-letter`を設定すると、要素の最初の1文字のスタイルを設定することができる。

```
index.html
<p>最初の行だけ太字・赤色にしています。</p>
```
```
style.css
p::first-letter {
  color: red;
  font-weight: bold;
}
```
`first-letter`を使用することで、最初の1文字だけ異なるスタイルを適用することが可能となる。
注意点として、この`first-letter`はインライン要素には適用できないということ。そのため、`<a>`タグなどのインライン要素に適用したい場合には、`display`プロパティを使って、ブロック要素やインラインブロック要素に変更するようにする。

---
**first-line**
`first-line`を設定すると、要素の最初の1行のスタイルを設定することができる。
```
index.html
<p>
  最初の行だけ太字・赤色にしています。<br>
  次の行は通常のスタイルです。
</p>
```
```
style.css
p::first-line {
  color: red;
  font-weight: bold;
}
```
`first-line`を使用することで、最初の1行だけ異なるスタイルを適用することが可能となる。なお、`first-letter`同様、この`first-line`もインライン要素には適用できないので注意。

---
**before/after**
`before`/`after`を設定すると、それぞれ要素の前/後に別の要素を追加し、なおかつそのスタイルを設定することができる。

```
index.html
<p class="before-text">beforeでテキストを追加しています。</p>
<p class="after-text">afterでテキストを追加しています。</p>
```
```
style.css
.before-text::before {
  color: red;
  font-weight: bold;
  content: "[Beforeで挿入!]";
}

.after-text::after {
  color: red;
  font-weight: bold;
  content: "[Afterで挿入!]";
}
```
**ブラウザでの表示結果（before/after）**
```
[Beforeで挿入!]beforeでテキストを追加しています。

afterでテキストを追加しています。[Afterで挿入!]
```
`before`/`after`を使用すると、設定した要素の前/後ろに別の要素を追加することができる。
なお、`before`/`after`の場合、新たに`content`というプロパティを追加する必要があり、ここに追加したいコンテンツを記述することになる。
この`content`プロパティに対して画像のパスを指定することによって、疑似要素に画像を設定することも可能。
**画像を設定する方法**
```
セレクタ::before {
  content: url("画像のパス");
}
```

---
**メディアクエリ**
メディアクエリは、CSS（カスケーディングスタイルシート）の一部であり、ウェブページのコンテンツが表示されるデバイスの種類や特性に基づいて、異なるスタイルルールを適用することを可能にする。

**基本的な使い方**
メディアクエリを使う際はあらかじめhtmlに`<meta name="viewport" content="width=device-width, initial-scale=1">`を記載する。このタグは、ウェブページがモバイルデバイス上でどのように表示されるかをブラウザに指示する。特にレスポンシブデザインを実装する際には、このタグが必須となる。
```
index.html
<!DOCTYPE html>
<html>
<head>
  <title>ページのタイトル</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- その他のメタタグやCSSリンクなど -->
</head>
<body>
  <!-- ページのコンテンツ -->
</body>
</html>
```
```
style.css
@media only screen and (max-width: 600px) {
  /* 600px以下の画面幅のデバイス向けのスタイル */
}
```
この例では、画面の幅が600ピクセル以下のデバイスに対して特定のスタイルルールを適用する。このようにして、小さい画面での閲覧を最適化できる。

---
**サンプル例1：画面幅に基づくメディアクエリ**
**小さい画面（例：スマートフォン）用**
```
@media only screen and (max-width: 600px) {
  body {
    background-color:lightblue;
  }
  .container {
    padding: 10px;
  }
}
```
**中くらいの画面（例：タブレット）用：**
```
@media only screen and (min-width: 601px) and (max-width: 1024px) {
  body {
    background-color: lightgreen;
  }
  .container {
    padding: 20px;
  }
}
```

**大きい画面（例：デスクトップ）用：**
```
@media only screen and (min-width: 1025px) {
  body {
    background-color: lightyellow;
  }
  .container {
    padding: 30px;
  }
}
```

---
**サンプル例2：フォントサイズとレイアウトの調整**
```
style.css
body {
  font-size: 16px;
  line-height: 1.6px;
}

/* 768px以下の画面サイズでフォントサイズを小さくし、パディングを調整 */
@media only screen and (max-width: 768px) {
  body {
    font-size: 14px;
    padding: 10px;
  }
}
```

---
**サンプル例3：画像の表示非表示**
```
style.css
.desktop-image {
  display: block;
}

.mobile-image {
  display: none;
}

/* 768px以下でデスクトップ用画像を非表示にし、モバイル用画像を表示 */
@media only screen and (max-width: 768px) {
  .desktop-image {
    display: none;
  }
  .mobile-image {
    display: block;
  }
}
```

---
**レスポンシブデザインの確認の仕方**
メディアクエリを実装したら実際に意図した動きになっているか確認する必要がある。確認方法は以下の通り。
1：確認したいページで右クリックを押して「検証」ボタンをクリック
2：toggle device toolbarをクリックして確認したいデバイスを選択