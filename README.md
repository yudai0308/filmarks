# README

## 1 Usersテーブル

|Column|Type|Options|
|------|----|-------|
|Filmarks_ID|string |null: false, unique: true, index: true|
|nickname   |string |null: false, index: true, index: true |
|image      |text   |                                      |
|comment    |text   |                                      |

### Association
- has_many :reviews
- has_many :likes
- has_many :comments
- has_many :movies, through: :clips
- has_many :clips
- has_many :members, through: :users_members
- has_many :users_members
- has_many :active_relationships, class_name:  "relationship", foreign_key: "follower_id", dependent: :destroy
- has_many :passive_relationships, class_name:  "relationship", foreign_key: "following_id", dependent: :destroy
- has_many :following, through: :active_relationships,  source: :followed
- has_many :followers, through: :passive_relationships, source: :follower

## 2 Moviesテーブル

|Column|Type|Options|
|------|----|-------|
|title    |string  |null: false, index: true|
|subtitle |string  |             |
|image    |text    |             |
|time     |string  |             |
|story    |text    |             |
|prodction|string  |             |
|release  |string  |             |

### Association
- has_many :reviews
- has_many :users, through: :clips
- has_many :clips
- has_many :members, through: :movies_members
- has_many :movies_members
- has_many :countrys, through: :movies_countrys
- has_many :movies_countrys
- has_many :genres, through: :movies_genres
- has_many :movies_genres
- has_many :awards, through: :movies_awards
- has_many :movies_awards

***
## 3 Reviewsテーブル

|Column|Type|Options|
|------|----|-------|
|comment    |text    |null: false             |
|score      |intege  |index: true,null: false |
|user_id    |references |null: false, index: true, foreign_key: true|
|movie_id   |references |null: false, index: true, foreign_key: true|
|status     |integer |null: false|

### Association
- has_many :tags
- has_many :comments
- has_many :likes
- belongs_to :user
- belongs_to :movie

***
## 4 Commentsテーブル

|Column|Type|Options|
|------|----|-------|
|comment      |string  |null: false|
|status       |integer |null: false|
|review_id    |references |null: false, foreign_key: true|
|user_id      |references |null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :review
***

## 5 Tagsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true, index: true|

### Association
- has_many :reviews, through: :reviews_tags
- has_many :reviews_tags
***

## 6 Clipsテーブル

|Column|Type|Options|
|------|----|-------|
|movie_id |references|null: false, foreign_key: true|
|user_id  |references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :movie

***

## 7 Likesテーブル

|Column|Type|Options|
|------|----|-------|
|review_id |references|null: false, foreign_key: true|
|user_id   |references|null: false, foreign_key: true|


### Association
- belongs_to :user
- belongs_to :review

***

## 8 Membersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|status|integer|null: false|

### Association
- has_many :movies, through: :movies_members
- has_many :movies_members
- has_many :users, through: :users_members
- has_many :users_members


***
## 9 Countrysテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :movies, through: :movies_countrys
- has_many :movies_countrys

***

## 10 Genresテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :movies, through: :movies_genres
- has_many :movies_genres

***

## 11 Awardsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :movies, through: :movies_awards
- has_many :movies_awards

***

## 12 Relationshipsテーブル

|Column|Type|Options|
|------|----|-------|
|following_id  |integer|null: false, index: true, unique: true| 
|follower_id   |integer|null: false, index: true, unique: true|

### Option
add_index :relationships, [:follower_id, :followed_id], unique: true


### Association
- belongs_to :follower, class_name: "User"
- belongs_to :following, class_name: "User"

* * *
## 13 Users_membersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id   |references |null: false ,foreign_key: true|
|member_id |references |null: false ,foreign_key: true|

### Association
has_many :users
has_many :members

***
## 14 Movies_membersテーブル

|Column|Type|Options|
|------|----|-------|
|movie_id |references |null: false ,foreign_key: true|
|member_id  |references |null: false ,foreign_key: true|

### Association
- belongs_to :movie
- belongs_to :cast

***
## 15 Movies_Countrysテーブル

|Column|Type|Options|
|------|----|-------|
|movie_id    |references |null: false, foreign_key: true|
|country_id  |references |null: false, foreign_key: true|

### Association
- belongs_to :movie
- belongs_to :country

***

## 16 Movies_Genresテーブル

|Column|Type|Options|
|------|----|-------|
|movie_id   |references |null: false, foreign_key: true|
|genre_id   |references |null: false, foreign_key: true|


### Association
- belongs_to :movie
- belongs_to :genre

***
## 17 Movies_Awardsテーブル

|Column|Type|Options|
|------|----|-------|
|movie_id    |references |null: false, foreign_key: true|
|award_id    |references |null: false, foreign_key: true|

### Association
- belongs_to :movie
- belongs_to :award
***

## 18 Reviews_Tagsテーブル

|Column|Type|Options|
|------|----|-------|
|review_id   |references |null: false, index: true, foreign_key: true|
|tag_id      |references |null: false, index: true, foreign_key: true|

### Association
- belongs_to :reviews
- belongs_to :tag
