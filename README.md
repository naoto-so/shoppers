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
現在、商品掲載機能を実装中。

その後、商品注文機能・注文確定機能を実装予定。

# データベース設計

[![Image from Gyazo](https://i.gyazo.com/3ada22eb80bda206e916f41052e26053.png)](https://gyazo.com/3ada22eb80bda206e916f41052e26053)

# 画面遷移図

[![Image from Gyazo](https://i.gyazo.com/8a37894cd7c182f1688b47bf3a98e3cd.png)](https://gyazo.com/8a37894cd7c182f1688b47bf3a98e3cd)
[![Image from Gyazo](https://i.gyazo.com/f5c09859f57dc30bc4cc0d5917a3b19d.png)](https://gyazo.com/f5c09859f57dc30bc4cc0d5917a3b19d)

# 開発環境
Ruby / Ruby on Rails / JavaScript(予定) / MySQL / GitHub / Heroku / Visual Studio Code / AWS(予定)

# ローカルでの動作方法
以下のコマンドを順に実行

% git clone https://shoppers-38148.herokuapp.com/

% cd shoppers

% bundle install

% yarn install

<!-- # 工夫したポイント -->







<!-- 

# テーブル設計

## usersテーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| admin              | boolean | null: false               |
| name               | string  | null: false               |
| kana               | string  | null: false               |
| tel                | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |

### Association
- has_many :orders

## itemsテーブル

| Column  | Type    | Options     |
| ------- | ------- | ----------- |
| item    | string  | null: false |
| explain | text    | null: false |
| price   | integer | null: false |

### Association
- has_one :order

## ordersテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |
| request | text       | null: false                    |
| pay_id  | integer    | null: false                    |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| city           | string     | null: false                    |
| address_number | string     | null: false                    |
| building       | string     |                                |
| order          | references | null: false, foreign_key: true |

### Association
- belongs_to :order

## postsテーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| title  | string | null: false |
| text   | text   | null: false |