## トップページ

![image](https://user-images.githubusercontent.com/57378304/74911995-1b6c3c00-5401-11ea-8055-409f7b6eda4b.png)

## アプリ名 scenery-post
ruby on ralis のフレームワークを利用し、景色を投稿するアプリを作成致しました。
アプリケーションの名前は景色（scenery）を投稿（post）するというシンプルな理由で付けました。  デプロイはherokuを利用しています



## なぜ作ったのか
### ・景色好きのためのアプリが欲しかった
昨今流行っている投稿アプリ（instagramなど）は人の写真などを中心に投稿する物が多いと感じ、純粋に景色だけを楽しむアプリがあれば、差別化を図ることもでき、景色好きの人が利用してくれるのではないかと思い作成しました。  


## URL
#### https://scenery-post.herokuapp.com/

## テストユーザー

<ul>
  <li>
    テストユーザー: sample
    <ul>
      <li>✉️メールアドレス: sanple@gmail.com</li>
      <li>🔑パスワード:1111aaaa
    </ul>
  </li>
</ul>


## 実装機能
#### ログイン機能
#### 投稿機能
#### ジャンル別詳細
#### いいね機能
#### ランキング機能
#### 編集,削除機能
#### スライドショー機能

## 工夫した点
<div align= "center">
  <h3>-投稿のジャンル別詳細-</h3>
</div>
投稿を景色のジャンル別にページを振り分けました。方法は投稿にgenre_idを付与し、pathにgenre_idを利用しました。この機能の実装理由は景色好きにみたいジャンルの景色を閲覧して欲しいためです。

```ruby:app/controllers/posts_controller.rb
  def show
    @posts = Post.where(genre_id: params[:id])
    ## genre_id()を持つ投稿を取得
  end
```

![image](https://user-images.githubusercontent.com/57378304/75004666-34332b00-54af-11ea-8b25-c60f23ecdccf.png)

 <div align= "center">
  <h3>-ランキング機能-</h3>
</div>
 いいねの多い投稿を上位3つのみトップページの最後に表示させました。表示はスライダーで動きを付けました。
 方法はorder('count(post_id) desc')でいいねが多い投稿をlimit(3)を指定し3つ持ってくる記述をしました。
 この機能の実装理由はより綺麗な景色を閲覧してもらうためです。

 ```ruby:posts_controller.rb
  def index
    @rank = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
    ## いいねのある投稿からいいねが多い投稿3つを取得
  end
 ```

 ```js:rank.js
  // スライダー
  $(function() {
    $('.ranks').slick({
        dots: true,
        autoplay: true,
        autoplaySpeed: 5000,
    });
  });
 ```

 
![b178abad123c2be32376f19d554115e7](https://user-images.githubusercontent.com/57378304/75137915-3a820b00-572c-11ea-9929-6ef3fcdf7e15.gif)















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

