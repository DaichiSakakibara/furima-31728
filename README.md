# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------------- | ------  | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| last_name       | string  | null: false |
| first_name      | string  | null: false |
| last_name_kana  | string  | null: false |
| first_name_kana | string  | null: false |
| birth_day       | date    | null: false |


### Association

- has_many :items
- has_many :orders




| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| title            | string     | null: false                    |
| text             | text       | null: false                    |
| category_id      | integer    | null: false                    |
| item_status_id   | integer    | null: false                    |
| which_pay_id     | integer    | null: false                    |
| prefectures_id   | integer    | null: false                    |
| how_long_days_id | integer    | null: false                    |
| price            | integer    | null: false                    |
| user_id          | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :order 
- belongs_to :category
- belongs_to :item_status
- belongs_to :which_pay
- belongs_to :prefectures
- belongs_to :how_long_days



## orders テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :add

## adds テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_number     | string     | null: false                    |
| prefectures_id  | integer    | null: false                    |
| municipality    | string     | null: false                    |
| address_number  | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |
| oder_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :order
- belongs_to :prefectures
