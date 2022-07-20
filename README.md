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

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |
| pay    | references | null: false                    |

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