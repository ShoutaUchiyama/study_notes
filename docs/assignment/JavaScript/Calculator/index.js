// ================================
// 電卓
// ================================

$(function () {
  const $display = $("#display");
  const $keys = $(".keys");

  // 現在の式と計算後フラグ
  let expression = "0";
  let justCalculated = false;

  // ユーティリティ関数
  const isOperator = (ch) => /[+\-*/]/.test(ch);          // 演算子判定
  const lastChar = () => expression.slice(-1);           // 式の最後の文字を取得
  const renderForDisplay = (exp) => exp.replaceAll("*", "×"); // 表示用に「*」を「×」へ
  const update = () => $display.text(renderForDisplay(expression)); // 表示更新
  const clearAll = () => { expression = "0"; justCalculated = false; update(); };

  // 最後の数値部分を取り出す（小数点制御用）
  function takeCurrentNumberChunk(exp) {
    const m = exp.match(/([+\-*/])?([0-9.]+)$/);
    return m ? m[2] : exp;
  }

  // 値を式に追加する処理
  const appendValue = (val) => {
    // 計算直後に数字入力 → 新規開始
    if (justCalculated && !isOperator(val)) {
      expression = "0"; justCalculated = false;
    }

    // 式が初期状態のとき
    if (expression === "0") {
      if (val === ".") { expression = "0."; return update(); }
      if (isOperator(val)) { expression = "0" + val; return update(); }
      if (val === "00") { return update(); }
      expression = String(val); return update();
    }

    // 演算子を追加
    if (isOperator(val)) {
      expression = isOperator(lastChar())
        ? expression.slice(0, -1) + val   // 直前が演算子なら置き換え
        : expression + val;
      justCalculated = false; return update();
    }

    // 小数点入力
    if (val === ".") {
      const tail = takeCurrentNumberChunk(expression);
      if (tail.includes(".")) return;  // すでに小数点ありなら無視
      expression += "."; return update();
    }

    // 00入力
    if (val === "00") { expression += "00"; return update(); }

    // 数字入力
    expression += val; update();
  };

  // 式の安全性チェック
  const sanitize = (exp) => {
    if (!/^[0-9+\-*/. ]+$/.test(exp)) return null;     // 不正文字禁止
    if (isOperator(exp.slice(-1))) exp = exp.slice(0, -1); // 末尾が演算子なら削除
    if (/(\.\.)|([+\-*/]{2,})/.test(exp)) return null; // 不正な連続演算子
    return exp;
  };

  // 計算処理
  const calculate = () => {
    const safe = sanitize(expression);
    if (safe == null) return;
    try {
      const result = Number(Function(`"use strict"; return (${safe});`)());
      if (Number.isFinite(result)) {
        // 計算結果を丸めて表示
        expression = String(+parseFloat(result.toFixed(12)));
        justCalculated = true;
        update();
      }
    } catch (e) { /* 計算失敗時は何もしない */ }
  };

  // ボタンクリック処理
  $keys.on("click", ".key", function () {
    const $btn = $(this);
    // ボタンを押したときのアニメーション
    $btn.stop(true, true).animate({ top: "+=1" }, 60).animate({ top: "-=1" }, 60);

    const act = $btn.data("action");
    if (act === "clear") return clearAll();
    if (act === "equals") return calculate();

    const val = $btn.data("value");
    if (val != null) appendValue(String(val));
  });

  // キーボード入力対応
  $(window).on("keydown", function (e) {
    const k = e.key;
    if (/\d/.test(k)) return appendValue(k);          // 数字
    if (["+", "-", "*", "/"].includes(k)) return appendValue(k); // 演算子
    if (k === ".") return appendValue(".");
    if (k === "Enter" || k === "=") { e.preventDefault(); return calculate(); }
    if (k === "Escape") return clearAll();
    if (k === "Backspace") {
      if (justCalculated) { clearAll(); return; }
      expression = expression.length > 1 ? expression.slice(0, -1) : "0";
      update();
    }
  });

  // 初期表示
  update();
});
