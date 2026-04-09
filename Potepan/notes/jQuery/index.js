$(document).ready(function() {
    $(".buttonA").click(function() {
        let get_text = $(".target_textA").text(); // テキストを取得し変数に入れている。
        alert(get_text); // テキストが取得できたかアラートで確認をする。
    });

    $(".buttonB").click(function() {
        $(".target_textB").text("文章が変更された！"); // テキストを変更する処理。
    });

    $(".buttonC").click(function() {
        $(".target_textB").text("文章が変わったぞ！"); // テキストを変更する処理。
    });

    $(".buttonD").click(function() {
        $(".target_textB").text("このテキストは変更前のテキスト。");
    });
});

$(document).ready(function() {
    $("#boxA").mouseover(function() {
        $("#boxA").css("background-color", "red"); // 背景色を赤に変更する処理
    });

    $("#boxB").mouseout(function() {
        $(this).css("background-color", "blue"); // 背景色を青に変更する処理
    });

    $("#boxC").hover(
        function() {
            $(this).css("font-size", "30px"); // フォントサイズを30pxにする
        },
        function() {
            $(this).css("font-size", "14px"); // フォントサイズを14pxにする
        }
    );

    $(".boxD").mouseover(function() {
        $("#boxA, #boxB").css("background-color", "white"); // 背景色を白に変更する処理
    });
});

$(document).ready(function() {
    $(".button_a").click(function() {
        $(".box_a").addClass("add_color_yellow"); // クラスの追加の処理
    });

    $(".button_b").click(function() {
        $(".box_a").removeClass("add_color_yellow"); // クラスの削除の処理
    });

    $(".button_c").click(function() {
        $(".box_b").addClass("add_hidden"); // display: none; のクラスを追加する処理
    });

    $(".button_d").click(function() {
        $(".box_b").removeClass("add_hidden"); // display: none; のクラスを削除する処理
    });
});