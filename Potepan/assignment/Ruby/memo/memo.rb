require "csv"

# ----------------------------------------
# メニュー選択関連
# ----------------------------------------

# @param [Integer] val ユーザーが入力した数値
# @return [Boolean] 1 または 2 のとき true
def validate_menu(val)
  [1, 2].include?(val)
end

# ユーザーに「新規作成」か「編集」かを尋ねる
# EOF(Ctrl+D / Windowsは Ctrl+Z+Enter) なら丁寧に終了
# @return [Integer] 1(新規) または 2(編集)
def ask_mode
  loop do
    puts "1(新規でメモを作成) 2(既存のメモを編集する)"
    print "> "
    raw = STDIN.gets
    if raw.nil?                       # 入力ストリームが閉じられた(EOF)
      puts "\n入力が終了したためプログラムを終了します。"
      exit 0
    end

    val = raw.to_i                    # 数値以外でも to_i は 0 になる
    return val if validate_menu(val)  # 1 または 2 なら確定

    puts "不正な値です。１か２を入力してください。"
  end
end

# ----------------------------------------
# ファイル名入力関連
# ----------------------------------------

# 用途に応じてファイル名を尋ねる
# - :create の場合: 既存なら上書き確認
# - :edit   の場合: 既存チェック(無ければ再入力させる)
# 入力に「.csv」が無ければ自動で拡張子を付与
#
# @param [Symbol] purpose :create または :edit
# @return [String] 確定した CSV パス(拡張子付き)
def ask_filename(purpose:)
  loop do
    puts "拡張子を除いたファイル名を入力してください（例：my_memo）"
    print "> "
    raw = STDIN.gets
    if raw.nil?
      puts "\n入力が終了したためプログラムを終了します。"
      exit 0
    end

    name = raw.chomp.strip
    next puts "ファイル名が空です。もう一度入力してください。" if name.empty?

    # 末尾が .csv でなければ付ける (例: "memo" -> "memo.csv")
    path = name.end_with?(".csv") ? name : "#{name}.csv"

    case purpose
    when :create
      # 既存ファイルがあるなら上書きの意思を確認
      if File.exist?(path)
        puts "注意：#{path}は既に存在します。上書きしますか？（y/n)"
        print "> "
        ans = STDIN.gets
        # "y" 以外ならやり直し (nil や空行も含め安全側に倒す)
        next unless ans && ans.chomp.downcase == "y"
      end
      return path

    when :edit
      # 編集は既存が前提。無ければ再入力へ。
      if File.exist?(path)
        return path
      else
        puts "指定のファイルが見つかりませんでした：#{path}"
        puts "もう一度入力してください"
      end
    end
  end
end

# ----------------------------------------
# CSV への書き込み
# ----------------------------------------

# 1 行入力ごとに CSV の 1 セルへ保存する
# EOF(Ctrl+D / Windowsは Ctrl+Z+Enter) で入力終了
#
# @param [String] path 保存先 CSV パス
# @param [String] mode "w"=新規(上書き) / "a"=追記
# @return [void]
def write_lines_to_csv(path, mode:)
  # CSV.open はブロック終了時に自動で close される
  CSV.open(path, mode) do |csv|
    puts "メモしたい内容を記入してください。1行ごとに Enter で反映します。"
    puts "入力を終了する場合は Ctrl + Z を押してください。（Mac は Ctrl + D）"

    # STDIN.gets が nil を返すまで(=EOF)ループ
    while (line = STDIN.gets)
      csv << [line.chomp]  # 1 列のみの行として追記
    end
  end

  puts "保存しました：#{path}"
end

# ----------------------------------------
# エントリーポイント
# ----------------------------------------

mode = ask_mode

if mode == 1
  # 新規作成(既存があれば上書き確認)
  path = ask_filename(purpose: :create)
  write_lines_to_csv(path, mode: "w")
else
  # 既存編集(存在確認済)
  path = ask_filename(purpose: :edit)
  puts "既存ファイルに追記します：#{path}"
  write_lines_to_csv(path, mode: "a")
end
