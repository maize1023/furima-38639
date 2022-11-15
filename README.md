## users table

| Column           | Type   | Options                   |
| ---------------- | ------ | ------------------------- |
| nickname         | string | null: false, unique: true |
| email            | string | null: false, unique: true |
| password         | string | null: false, unique: true |
| kanji_last_name  | string | null: false               |
| kanji_first_name | string | null: false               |
| kana_last_name   | string | null: false               |
| kana_first_name  | string | null: false               |
| birthday         | string | null: false               |

### Association

- has_many :items
- has_many :purchase_records

## items table

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| image       | string     | null: false                    |
| description | text       | null: false                    |
| category    | string     | null: false                    |
| condition   | string     | null: false                    |
| fee         | string     | null: false                    |
| from        | string     | null: false                    |
| date        | string     | null: false                    |
| price       | string     | null: false                    |
| user_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :purchase_record
- has_many :comments

## purchase_records table

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item_id | references | null: false, foreign_key: true |
| user_id | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :address

## addresses table

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_code          | string     | null: false                    |
| prefecture         | string     | null: false                    |
| town               | string     | null: false                    |
| street             | string     | null: false                    |
| building           | string     | null: false                    |
| phone              | string     | null: false                    |
| purchase_record_id | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_records

## comments table

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | string     | null: false                    |
| item_id | references | null: false, foreign_key: true |
| user_id | references | null: false, foreign_key: true |

### Association

- belongs_to :items
- belongs_to :users
