# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

<<<<<<< Updated upstream
* How to run the test suite
=======
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
>>>>>>> Stashed changes

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

<<<<<<< Updated upstream
* ...
=======
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
| user_id         | references | null: false, foreign_key: true |
| item_id         | references | null: false, foreign_key: true |


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
>>>>>>> Stashed changes
