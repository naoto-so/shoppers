# アプリケーション名
Shoppers

# アプリケーション概要
お買い物代行アプリ。

アプリ上で買ってきて欲しい物を注文することができる。

# URL
https://shoppers-38148.herokuapp.com/

# テスト用アカウント
・Basic認証ID：shoppers_admin

・Basic認証パスワード：38148

・メールアドレス：

・パスワード：

# 利用方法
1．一覧ページのヘッダーから新規登録を行う

2．注文したい商品を積み上げていき、注文詳細画面に進む

3．注文内容を確認しリクエストを記載して注文確定する

# アプリケーションを作成した背景
友人が買物代行サービスを始めたいと思っており、そのためのアプリケーションを必要としていた。自分自身もそういったサービスやアプリケーションに興味があったため、お買い物代行アプリを開発してみようと決めた。現代社会における高齢化や新型コロナウィルスの影響により外出が困難とされる方々に対し有意義なサービスであると考えた。

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1An_pez49KeCL_nDz16VDP1tPSFaTFhr3vSay2PVd7zc/edit#gid=982722306

<!-- # 実装した機能についての画像やGIFおよびその説明 -->

# 実装予定の機能
商品注文機能・注文確定機能を実装中。

その後、フロント実装やメール通知機能を実装予定。

# データベース設計

[![Image from Gyazo](https://i.gyazo.com/3ada22eb80bda206e916f41052e26053.png)](https://gyazo.com/3ada22eb80bda206e916f41052e26053)

# 画面遷移図

[![Image from Gyazo](https://i.gyazo.com/8a37894cd7c182f1688b47bf3a98e3cd.png)](https://gyazo.com/8a37894cd7c182f1688b47bf3a98e3cd)
[![Image from Gyazo](https://i.gyazo.com/f5c09859f57dc30bc4cc0d5917a3b19d.png)](https://gyazo.com/f5c09859f57dc30bc4cc0d5917a3b19d)

# 開発環境
Ruby / Ruby on Rails / MySQL / GitHub / Heroku / Visual Studio Code / AWS

# ローカルでの動作方法
以下のコマンドを順に実行

% git clone https://shoppers-38148.herokuapp.com/

% cd shoppers

% bundle install

% yarn install

# 工夫したポイント
商品をアプリ上に掲載するのは管理者のみなので、出品に関する操作ができるのを管理者のみに制限した。
deviseに導入されているadminという機能を使い管理者ユーザーを作成しアクションの制限とフロント実装により一般ユーザーが出品できないよう工夫した。