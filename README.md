# README

# scenery-post DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|username|string|null: false|
### Association
- has_many :posts

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|body|text|
|image|string|
|title|text|
|body|genre|
### Association
- belongs_to :user
- belongs_to :genre
- has_many :goods

## genresテーブル
|Column|Type|Options|
|------|----|-------|
|nature_view|text|null: false|
|ctiy_view|text|null: false|
|ivent_view|text|null: false|
### Association
- has_many :post

## goodsテーブル 未完成
|Column|Type|Options|
|------|----|-------|

### Association
- belongs_to :user











### 参考
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|nickname|string|null: false|
### Association
- has_many :messages
- has_many :groups,  through: :groups_users
- has_many :groups_users

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|body|text|
|image|string|
|group_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :group

## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|text|null: false|
### Association
- has_many :message
- has_many :users, through: :groups_users
- has_many :groups_users

## groups_usersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|group_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :group
