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
| category_id    | integer    | null: false                    |
| condition_id   | integer    | null: false                    |
| shipment_fee_id| integer    | null: false                    |
| prefecture_id  | integer    | null: false                    |
| lead_time_id   | integer    | null: false                    |
| price          | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |

### association
- belongs_to :user
- has_one :order


## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### association
- belongs_to :user
- belongs_to :item
- has_one :shipment

## shipments テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| zip_code      | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| branch        | string     | null: false                    |
| building      | string     |                                |
| phone         | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### association
- belongs_to :order