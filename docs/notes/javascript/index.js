// コンソール出力
console.log("この文字列がコンソールに表示されます。");

// ■JavaScriptの変数
// var：古い形式の変数宣言。関数スコープを持ち、再宣言が可能。予期せぬ挙動を引き起こすことあり。
// let：ES6以降で導入された変数宣言方法。ブロックスコープを持ち、再宣言はできないが、値の再代入は可能。
// const：letと同じくES6で導入され、ブロックスコープを持つが、一度代入された値は変更できない（定数）。

// 変数宣言と初期化
let age = 25; //'let'を使用して変更可能な変数を宣言
const name = 'Alice'; // 'const' を使用して変更不可能な変数を宣言

// 変数の使用
console.log(name + ' is ' + age + ' years old.'); // 変数を組み合わせて文字列を作成

// 変数の値を更新
age = 26; // 'let'で宣言した変数の値は変更可能

// 更新した値を使用
console.log(name + ' will be ' + age + ' next year.');

// 配列を格納する変数
let colors = ["赤", "緑", "青"];
console.log(colors[0]); // 出力：赤

// オブジェクトを格納する変数
let person = {
    firstName: "Bob",
    lastName: "Smith",
    age: 25
};
console.log(person.firstName); // 出力：Bob

// 関数を格納する変数
let greet = function(name) {
    return "こんにちは、" + name + "さん!";
};
console.log(greet("Alice")); // 出力：こんにちはAliceさん！

// ■ 変数の命名規則
//  ・変数名は英字、アンダーバーと$マーク
//  ・変数名の先頭に数字は使用不可
//  ・予約語は使用できない

// ■ データの型
//  文字列型：string
//  数値型：number
//  真偽値型：boolean
//  null型：null

// 文字列型はダブルクォーテーションで囲む
let exString1 = "文字列";
let exString2 = "100";

// 数字型は数字を記述する
let exNumber = 100;

// 真偽値方はtrueまたはfalseのどちらかを記載
let booleanType1 = true;
let booleanType2 = false;

// nullの書き方
let type1 = null;
let type2;

// 関係演算子
// ==：両辺が同じ値か判定
// ===：両辺の値と型の両方が合っているか判定

// ■ イベント
// 例えばクリックがその要素が発生すると、属性に指定されたJavaScript関数が実行される。
function showMessage() {
    alert('ボタンがクリックされました！');
}

// getElementByIdメソッドでボタン要素を取得し、
// addEventListenerメソッドを使ってクリックイベントに反応する無名関数を追加している。
// ボタン要素を取得
var button = document.getElementById('myButton');

// クリックイベントリスナーを追加
button.addEventListener('click', function() {
    alert('ボタンがクリックされました！（2）')
})

// ■ イベントの基本的な使い方
// HTML
// <イベントが使用可能なタグ イベント=呼び出すJavaScriptの関数名();>
// JavaScript
// function 関数名() {
//   イベント発火時の処理
// }

function eventA() {
    alert("onclickイベントが発火しました");
}

function eventB() {
    alert("oninputイベントが発火しました");
}

function eventC() {
    alert("onmouseoutイベントが発火しました");
}

function eventD() {
    alert("onmouseoverイベントが発火しました");
}