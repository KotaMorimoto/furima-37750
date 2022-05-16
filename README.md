# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |

### Association
- has_many :orders
- has_many :items

## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| name           | string     | null: false                    |
| description    | text       | null: false                    |
| category       | string     | null: false                    |
| condition      | string     | null: false                    |
| shipment_fee   | string     | null: false                    |
| delivered_from | string     | null: false                    |
| lead_time      | string     | null: false                    |
| price          | int        | null: false                    |
| available      | boolean    | null: false                    |
| user_id        | references | null: false, foreign_key: true |

### association
- belongs_to :user
- has_one :order


## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item_id   | references | null: false, foreign_key: true |
| buyer_id  | references | null: false, foreign_key: true |

### association
- belongs_to :user
- belongs_to :item
- has_one :shipment

## shipments テーブル
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| zip_code  | string     | null: false                    |
| prefecture| string     | null: false                    |
| city      | string     | null: false                    |
| branch    | string     | null: false                    |
| building  | string     | null: true                     |
| phone     | string     | null: false                    |
| order_id  | references | null: false, foreign_key: true |

### association
- belongs_to :order