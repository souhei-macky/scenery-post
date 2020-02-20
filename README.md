# トップページ

![image](https://user-images.githubusercontent.com/57378304/74911995-1b6c3c00-5401-11ea-8055-409f7b6eda4b.png)

# アプリ名 scenery-post
ruby on ralis のフレームワークを利用し、景色を投稿するアプリを作成致しました。
アプリケーションの名前は景色（scenery）を投稿（post）するというシンプルな理由で付けました。



# なぜ作ったのか
## ・景色好きのためのアプリ欲しかった
昨今流行っている写真投稿のアプリ（instagramなど）は人の写真などを中心に投稿する物が多いと感じ、純粋に景色だけを楽しむアプリがあれば、差別化を図ることもでき、利用してくれる人もいるのではないかと思い作成しました。




# URL





# scenery-post DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|username|string|null: false|
### Association
- has_many :posts, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :liked_posts, through: :likes, source: :post

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|genre_id|integer|null: false|
|title|string|null: false|
|image|text|null: false|
|text|string|
|user|references|foreign_key: true|
### Association
- belongs_to :user, optional: true
- has_many :likes, dependent: :destroy
- has_many :liked_users, through: :likes, source: :user

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true|
|post|references|foreign_key: true|
### Association
- belongs_to :user, optional: true
- belongs_to :post, optional: true

