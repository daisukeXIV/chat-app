# README

# テーブル設計
##　users テーブル
|Column            |Type  |Options   |
| ---------------- | ---- | -------- |
|name              |string|null:false|
|email             |string|null:false ,unique:true|
|encrypted_password|string|null:false|


### Association

- has_many :room_users
- has_many :room, through: :room_users
- has_many :messages

## room テーブル

|Column|Type  |Options   |
| ---- | ---- | -------- |
|name  |string|null:false|

### Association

- has_many :room_users
- has_many :users, through: :rom_users
- has_many :messages
## room_users テーブル

|Column|type      |Options                      |
| ---- | -------- | --------------------------- |
|user  |references|null:false, foreign_key: true|
|room  |references|null:false, foreign_key: true|

### Association

- belongs_to :room
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                       |
| ------- | ---------- | ----------------------------- |
| content | string     | null:false                    |
| user    | references | null:false, foreign_key: true |
| room    | references | null:false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user