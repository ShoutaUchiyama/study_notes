# じゃんけん→あっち向いてホイ

# 手と方向は定数（配列）で管理
HANDS      = %w[グー チョキ パー].freeze
DIRECTIONS = %w[上 下 左 右].freeze
SEPARATOR  = "-" * 24

# --- 入力ユーティリティ ---
# 指定レンジの整数入力を促し、バリデーションして返す。
# 無効入力（文字列/範囲外）は再入力させる。
def read_choice(range, prompt)
  loop do
    print prompt
    input = STDIN.gets
    # EOF（Ctrl+Dなど）対応：nilなら終了扱いで nil を返す
    return nil if input.nil?

    begin
      n = Integer(input.strip)
    rescue ArgumentError
      puts "数値で入力してください。"
      next
    end

    if range.include?(n)
      return n
    else
      puts "入力は#{range.first}〜#{range.last}の範囲で選んでください。"
    end
  end
end

# --- じゃんけん判定 ---
# a: 自分の手(0..2), b: 相手の手(0..2)
# (a - b) % 3 の結果：
# 0 → あいこ, 1 → 負け, 2 → 勝ち
def judge_janken(a, b)
  c = (a - b) % 3
  return :draw if c == 0
  return :win  if c == 2
  :lose
end

# --- 表示ユーティリティ ---
def show_hands(my, npc)
  puts SEPARATOR
  puts "あなたは#{HANDS[my]}を出しました"
  puts "相手は#{HANDS[npc]}を出しました"
  puts SEPARATOR
end

def show_directions(my, npc)
  puts "あなた：#{DIRECTIONS[my]}"
  puts "相手：#{DIRECTIONS[npc]}"
end

# --- メインループ ---
# count は掛け声の切り替えに利用（0: 最初, 1: あいこ）
count = 0

loop do
  # 掛け声（1回目は「じゃんけん…」→「ホイ！」、あいこ後は「ショ！」）
  if count == 0
    puts "じゃんけん..."
  else
    puts "あいこで..."
  end

  # 自分の手を入力（3で終了）
  puts "0(グー) 1(チョキ) 2(パー) 3(戦わない)"
  my_hand = read_choice(0..3, "> ")
  if my_hand.nil? || my_hand == 3
    puts "じゃんけんを終了"
    break
  end

  npc_hand = rand(3)  # 0..2 のいずれか

  # 掛け声の後に手を公開
  puts(count == 0 ? "ホイ！" : "ショ！")
  show_hands(my_hand, npc_hand)

  result = judge_janken(my_hand, npc_hand)

  # あいこの場合は掛け声を切り替えてやり直し
  if result == :draw
    count = 1
    next
  end

  # じゃんけんに勝敗がついたら「あっち向いてホイ」
  puts "あっち向いて～"
  puts "0(上) 1(下) 2(左) 3(右)"
  select = read_choice(0..3, "> ")
  # EOF対応：nil は即終了
  if select.nil?
    puts "入力がありませんでした。終了します。"
    break
  end

  puts "ホイ！"
  puts SEPARATOR
  npc_select = rand(4)

  show_directions(select, npc_select)

  # 同じ方向を向いたら、じゃんけんの勝者が最終勝者
  if select == npc_select
    if result == :win
      puts "あなたの勝ち！"
    else
      puts "NPCの勝ち！"
    end
    break
  end

  # 向きが一致しなければ最初から
  count = 0
end
