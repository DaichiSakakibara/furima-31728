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
| birth_month     | integer | null: false |
| birth_day       | integer | null: false |


### Association

- has_many :items
- has_many :orders


## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| title           | text       | null: false                    |
| text            | text       | null: false                    |
| category        | text       | null: false                    |
| which_pay       | text       | null: false                    |
| where_send      | text       | null: false                    |
| how_long_days   | integer    | null: false                    |
| price           | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true |



### Association

- belongs_to :user
- has_one :order 

## orders テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| card_number     | integer    | null: false                    |
| card_month      | integer    | null: false                    |
| card_year       | integer    | null: false                    |
| security_code   | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true |
| item_id         | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :add

## adds テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_number     | integer    | null: false                    |
| prefectures     | string     | null: false                    |
| municipality    | text       | null: false                    |
| address_number  | text       | null: false                    |
| building_name   | text       | null: true                     |
| phone_number    | integer    | null: false                    
| oder_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :order