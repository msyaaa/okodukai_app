# README

# アプリケーション名
- ### Money Management
![トップページ画像](https://i.gyazo.com/c4520bc9bc3a7988ddb97246a00935e6.jpg)

Money Managementは子供用のお小遣い帳アプリケーションです。

# アプリケーション概要
ユーザーはお金の収支記録を日付、金額、メモと一緒に記録しておくことができます。<br>
またその記録履歴を確認することができます。

# 本番環境(デプロイ先　テストアカウント＆ID)
### URL
https://okodukai-app.herokuapp.com/

### テスト用アカウント
- ニックネーム: aaa
- パスワード: aaa111

### 利用方法
- 支出登録方法<br>
テストアカウントでログイン→トップページから「ひきだす」ボタン押下→支出情報入力→決定
- 収入登録方法<br>
テストアカウントでログイン→トップページから「貯める」ボタン押下→収入情報入力→決定
- 確認後、ログアウト処理をお願いします。

### 注意事項
- WebブラウザGoogle Chromeの最新版を利用してアクセスしてください。<br>
ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続してください。
- 接続先およびログイン情報については、上記の通りです。
- 同時に複数の方がログインしている場合に、ログインできない可能性があります。

# 目指した課題解決、制作背景（意図）
#### 課題
ノートなどにしっかりと記録を取って、細かく管理するのは子供にとって難しい
#### 解決策
シンプルな操作で、簡単にお金の管理ができるものがあると良い
<br>
<br>
私自身が小さい頃からお小遣い帳をつけていた経験から、このアプリケーションを通じて、小学生以下の子供が自分で簡単にお金の管理をできるようにできたらいいなと考えました。

# 洗い出した要件
|     機能     |            目的           |              詳細              |         ストーリー(ユースケース)         |
| ----------- | ------------------------- | ----------------------------- | ---------------------------------- |
| 支出登録機能 | 支出情報を記録できるようにするため | 支出情報を入力することで記録できる |	 ・ 支出金額、メモ、日付を記録する    |
| 収入登録機能 | 収入情報を記録できるようにするため | 収入情報を入力することで記録できる | ・ 収入金額、メモ、日付を記録する<br> ・ 貯金額がマイナスになる場合は記録できないようにする |
|  目的機能   | 自分が何のためにお金の管理をしているのかを確認できるようにするため | 目標を入力することでトップペー ジに表示する	| ・ 目標を決定しそのままトップページに表示される |
| 編集・削除機能 | 入力情報の間違いを修正・削除できるようにするため | 収支の情報の編集・削除を可能にする | ・ 収支は数回登録されていることが前提<br> ・ 編集を選択した場合、既に金額、メモ、日付は入力されている状態で表示される<br> ・ 貯金額がマイナスになる場合は編集・削除できないようにする |
| ユーザー登録機能 | ログインしているユーザーだけがアプリケーションを利用できるようにするため | ニックネームとパスワードを登録することでアプリケーションが利用可能になる | ・ ユーザー登録をニックネームとパスワードで登録できるようにする<br> ・ ユーザー登録をしていないとその他機能は使用できない |
| 履歴管理機能 | 今までの記録を管理できるようにするため | 履歴から今までの支出・収入の記録を確認できる | ・ 収支が数回登録されていることが前提<br> ・ 登録されているものを支出と収入に分けて表示する |
| エラーメッセージの日本語化 | どのようなエラーが出ているのかをわかりやすくするため | 入力したフォーム内容に情報が足りていないときにエラー文を日本語で表示する | ・ フォーム入力に失敗した時にエラーメッセージを日本語で表示する |
| カレンダー表示機能 | 収支を一目で確認できるようにするため | 履歴画面に収支情報が記載されているカレンダーを表示する | ・ 収支が数回登録されていることが前提<br> ・ 登録されている収支情報をカレンダー上に表示する |
| 貯金合計金額表示機能 | 今の貯金額を確認できるようにするため | 今までの記録をもとにトップページに今の貯金額を表示する | ・ 収支が数回登録されていることが前提<br> ・ 支出と収入を登録していくことで自動的に貯金額が表示される |
| 履歴の表示切り替え機能 | 画面遷移を行わず支出と収入の記録を確認できるようにするため | ワンクリックで支出と収入の記録を切り替えを可能にする | ・ 収支が数回登録されていることが前提<br> ・ 支出と収入の履歴を一つの画面で表示する |

# 実装した機能についてのGIFと説明
### 支出登録機能
「ひきだす」をクリックすると、ユーザーは支出の情報をフォームに入力することができます。
![支出登録機能](https://user-images.githubusercontent.com/64127463/94362724-5bfb0900-00f8-11eb-8244-e1b95e8a553b.gif)

### 収入登録機能
「ためる」をクリックすると、ユーザーは収入の情報をフォームに入力することができます。
![収入登録機能](https://user-images.githubusercontent.com/64127463/94362654-e42cde80-00f7-11eb-97db-86f30e91801a.gif)

### 目標機能
目標入力欄に入力し「決定」をクリックすると、目標の設定を行うことができます。
![目標機能](https://i.gyazo.com/12e2b52d1ed631be82e7fed368b45632.png)

### 編集・削除機能
履歴表示画面に遷移し、「編集」をクリックすると登録した内容を変更することができます。また、「削除」をクリックすると登録した内容を削除することができます。
![編集・削除機能](https://user-images.githubusercontent.com/64127463/94362783-aaa8a300-00f8-11eb-89c2-210d4c8e86ac.gif)

### ユーザー登録機能
トップページから「アカウントを作る」をクリックし、「ニックネーム」と「パスワード」を入力することでユーザー登録を行うことができます。また、ログインも同様に行うことができます。
![ユーザー登録機能](https://user-images.githubusercontent.com/64127463/94362816-ce6be900-00f8-11eb-8111-d7152d319023.gif)

### 履歴管理機能
「履歴」をクリックすると、今までの支出と収入の記録を確認することができます。
![履歴管理機能](https://user-images.githubusercontent.com/64127463/94362834-ee031180-00f8-11eb-8dfb-e8d1b40745dd.gif)

### エラーメッセージの日本語化
ユーザー登録画面や支出・収入登録ページにアクセスし適当な文字をフォームに入力すると、エラーメッセージを日本語で確認することができます。フォームに何も入力していない場合でもエラーメッセージの確認はできます。
![エラーメッセージの日本語化](https://user-images.githubusercontent.com/64127463/94362848-06732c00-00f9-11eb-9a87-ad2bb4015334.gif)

### カレンダー表示機能
「履歴」をクリックすると、今までの支出と収入の情報が記載されているカレンダーを確認することができます。
![カレンダー表示機能](https://i.gyazo.com/c2918b850e340a92cfe594462756b803.jpg)

### 貯金合計金額表示機能
トップページに今まで記録してきた支出と収入の情報を元に、「貯金額」が表示されます。
![貯金合計金額表示機能](https://i.gyazo.com/cc00bdeb7bb806db89315f5225bc823f.png)

### 履歴の表示切り替え機能
履歴表示画面に遷移し、「使ったお金」または「貯まったお金」をクリックすることで「支出」または「収入」の履歴画面に切り替えることができます。
![履歴の表示切り替え機能](https://user-images.githubusercontent.com/64127463/94362896-476b4080-00f9-11eb-96ed-1a72098a86e8.gif)

# 工夫したポイント
- 難しい漢字には読み仮名を振ったこと
- カレンダーを用いたりCSSで見た目をわかりやすくしたこと
- フォントを柔らかい雰囲気にしたこと
- 目標機能を設けたこと
- 貯金額がマイナスになる操作をできないようにしたこと
- ユーザー登録をニックネームとパスワードで設定したこと

# 使用技術(開発環境：言語、ツール、OS、DB、サーバ)
Ruby/Ruby on Rails/JavaScript/MySQL/Github/AWS/Visual Studio Code

# 課題や実装予定の機能
- アカウントを作成していないときの画面表示を変える
- 月変更したときに支出履歴画面→収支履歴画面に切り替わらないようにする
- カレンダーの収支記録をクリックしたときにも変更や削除を行えるようにする
 - 「これまでの記録」を月毎に確認できるようにする
- 月間の総収支のグラフ化
- レスポンシブ機能を加える
- 親が管理できる機能を加える
- 連続クリック防止

# テーブル設計
## ER図
![データベース設計ER図](https://i.gyazo.com/8d996c0d6d897bbb1aa620848366aacc.png)

## users テーブル
|     Column     |    Type    |   Options   |
| -------------- | ---------- | ----------- |
|     nickname   |   string   | null: false |
|     password   |   string   | null: false |
| password_confirmation | string | null: false |

### Association
- has_many :incomes
- has_many :outgos
- has_one :goal

## incomes テーブル
|  Column  |    Type    |   Options   |
| -------- | ---------- | ----------- |
|   price  |   integer  | null: false |
| description |  text   | null: false |
|   date   |    date    | null: false |
|   user   | references | null: false, foreign_key: true |

### Association
- belongs_to :user

## outgos テーブル
|  Column  |    Type    |   Options   |
| -------- | ---------- | ----------- |
|   price  |   integer  | null: false |
| description |  text   | null: false |
|   date   |    date    | null: false |
|   user   | references | null: false, foreign_key: true |

### Association
- belongs_to :user

## goals テーブル
|  Column |  Type  |   Options   |
| ------- | ------ | ----------- |
|   text  |  text  |
|   user  | references | null: false, foreign_key: true | 

### Association
- belongs_to :user

# ローカルでの動作方法
以下を順に実行してください。
#### ターミナル 
```
$ git clone https://github.com/msyaaa/okodukai_app.git
$ cd okodukai_app.git
$ bundle install
$ rails db:create
$ rails db:migrate
$ rails s
```
http://localhost:3000 にアクセス

### requirement
- ruby '2.6.5'
- rails　'6.0.0'
- simple_calendar "~> 2.0"
- rails-i18n

# 著者
[Qiita](https://qiita.com/iwkmsy9618)

# license
This software is released under the MIT License, see LICENSE.txt.
