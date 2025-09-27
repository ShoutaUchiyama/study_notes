// ================================
// ストップウォッチ（設定値は変更しない）
// - インターバル: 100ms
// - 時分秒ミリ秒の上限・桁上がりロジックは元のまま
// - DOM構造やクラス名／IDはそのまま利用
// - 機能の追加・削除はせず、読みやすさと保守性を改善
// ================================

$(document).ready(function () {
  // ----------------
  // 定数（DOMセレクタ等）
  // ----------------
  const timeSelectors = [".hours", ".minutes", ".seconds", ".milliseconds"];
  const HOUR = 0, MINUTE = 1, SECOND = 2, MILLISECOND = 3;

  // ボタンのjQueryオブジェクトを事前に取得
  const $startBtn = $("#startBtn");
  const $stopBtn = $("#stopBtn");
  const $resetBtn = $("#resetBtn");
  const $allBtns = $(".stopWatch-btnChild");

  // ----------------
  // 状態（数値・タイマー）
  // ----------------
  let hr = 0, min = 0, sec = 0, ms = 0; // 初期値
  let timerId = null;                   // setInterval のID（稼働中判定にも使用）

  // ----------------
  // DOM反映系ユーティリティ
  // ----------------

  /**
   * 指定セレクタのテキストを数値で更新
   * @param {string} selector
   * @param {number} num
   */
  function reflection(selector, num) {
    $(selector).text(String(num));
  }

  /**
   * 4つの時刻表示をまとめて反映
   */
  function renderAll() {
    reflection(timeSelectors[HOUR], hr);
    reflection(timeSelectors[MINUTE], min);
    reflection(timeSelectors[SECOND], sec);
    reflection(timeSelectors[MILLISECOND], ms);
  }

  // ----------------
  // ボタン状態制御ユーティリティ
  // ----------------

  /**
   * すべてのボタンを有効化し、引数のボタンだけを無効化（hoverも不可）にする。
   * - UI上「いま押せないボタン」を視覚的に明示する目的
   * @param {JQuery} $btn 無効化したいボタン
   */
  function activateButtons($btn) {
    $allBtns.removeClass("no-hover").prop("disabled", false);
    $btn.addClass("no-hover").prop("disabled", true);
  }

  /**
   * 単一ボタンのみを無効化（hoverも不可）にする。
   * - リセット中だけ押せない等の細かな制御用
   * @param {JQuery} $btn
   */
  function activateButton($btn) {
    $btn.addClass("no-hover").prop("disabled", true);
  }

  // ----------------
  // カウントアップ・ロジック
  // ----------------

  /**
   * 100ms ごとに呼ばれる加算ロジック。
   * 元コードの桁上げ条件を完全踏襲（msは0〜9で1/10秒、sec・minは0〜59）。
   */
  function tick() {
    ms++;
    if (ms === 10) {
      ms = 0;
      sec++;
      if (sec === 60) {
        sec = 0;
        min++;
        if (min === 60) {
          min = 0;
          hr++;
        }
      }
    }
    renderAll();
  }

  // ----------------
  // コントロール操作（start/stop/reset）
  // ----------------

  /**
   * すでに動作中なら何もしないで早期return（多重起動防止）。
   * 開始時は「スタート」を無効化、他ボタンは有効化。ただし「リセット」は即時無効化。
   */
  function handleStart() {
    activateButtons($startBtn);
    activateButton($resetBtn); // 元の挙動を維持

    if (timerId !== null) return; // すでに起動中

    timerId = setInterval(tick, 100); // インターバル値は変更しない
  }

  /**
   * 稼働中のみ停止。停止後は「ストップ」を無効化、他ボタンは有効化。
   */
  function handleStop() {
    if (timerId === null) return;
    clearInterval(timerId);
    timerId = null;
    activateButtons($stopBtn);
  }

  /**
   * 稼働中であれば停止→数値クリア→描画→ボタン状態調整（元の順序を維持）。
   * 停止後は「リセット」無効化、さらに「ストップ」も無効化にする指定を踏襲。
   */
  function handleReset() {
    if (timerId !== null) {
      clearInterval(timerId);
      timerId = null;
    }
    hr = min = sec = ms = 0;
    renderAll();
    activateButtons($resetBtn);
    activateButton($stopBtn);
  }

  // ----------------
  // イベントバインド
  // ----------------
  $startBtn.on("click", handleStart);
  $stopBtn.on("click", handleStop);
  $resetBtn.on("click", handleReset);

  // 初期描画（0表示）
  renderAll();
});
