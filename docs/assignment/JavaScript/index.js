// ================================
// ストップウォッチ
// ================================

$(document).ready(function () {
  // ----------------
  // 定数（DOMセレクタ等）
  // ----------------
  const timeSelectors = [".hours", ".minutes", ".seconds", ".milliseconds"];
  const HOUR = 0, MINUTE = 1, SECOND = 2, MILLISECOND = 3;
  const MS_PER_SEC = 10;     // ミリ秒カウンタが1秒になるまでの単位
  const SEC_PER_MIN = 60;    // 秒が1分になるまで
  const MIN_PER_HR  = 60;    // 分が1時間になるまで
  const RESET_VALUE = 0;

  // ボタンのjQueryオブジェクトを事前に取得
  const $startBtn = $("#startBtn");
  const $stopBtn = $("#stopBtn");
  const $resetBtn = $("#resetBtn");
  const $allBtns = $(".stopWatch-btnChild");

  // ----------------
  // 状態（数値・タイマー）
  // ----------------
  let hr = min = sec = ms = RESET_VALUE; // 初期値
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
    if (ms === MS_PER_SEC) {
      ms = RESET_VALUE;
      sec++;
      if (sec === SEC_PER_MIN) {
        sec = RESET_VALUE;
        min++;
        if (min === MIN_PER_HR) {
          min = RESET_VALUE;
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
    hr = min = sec = ms = RESET_VALUE;
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
