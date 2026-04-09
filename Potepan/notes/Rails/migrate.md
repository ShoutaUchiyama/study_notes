## モデルとマイグレーション
モデルとマイグレーションを作成するgenerateコマンド
```
rails generate model モデル名 カラム名1:データ型1, カラム名2:データ型2,...
```

generateによるモデル作成で生成されるファイル
| 作成されるファイル | ファイル名(Userの場合) | 作成されるディレクトリ |
| :-- | :--| :-- |
| モデルファイル | user.rb | app/models |
| マイグレーションファイル | 作成した日時.rb | db/migrate |

ターミナルで以下のコマンドを実行してモデルとマイグレーションを作成する。
```
rails g model User name:string email:string age:integer introduction:string
```

**マイグレーションファイルを実行しテーブルを作成するコマンド**
```
rails db:migrate
```

**DBのコンソールに入る**
```
raisl dbconsole
```

**テーブルを確認**
```
rails dbconsole
```

**tableの定義を確認する**
```
.schema テーブル名
```