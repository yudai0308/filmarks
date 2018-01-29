# README

## 1 Usersテーブル

|Column|Type|Options|
|------|----|-------|
|ID         |integer|null: false, unique: true, index: true|
|nickname   |string |null: false, index: true              |
|image      |text   |                                      |
|comment    |text   |                                      |

### Association
- has_many : Reviews
- has_many : likes
- has_many : comments
- has_many : Relationships through:?
- has_many : Movies through: Reviews
- has_many : Movies through: clip
- has_many :active_relationships, class_name:  "Relationship", foreign_key: "follower_id", dependent: :destroy
- has_many :active_relationships, class_name:  "Relationship", foreign_key: "following_id", dependent: :destroy

## 2 Moviesテーブル

|Column|Type|Options|
|------|----|-------|
|title     |string  |null: false, index: true|
|subtitle  |string  |             |
|image     |text    |             |
|上映時間   |string  |             |
|あらすじ   |text    |             |
|製作年     |string  |             |
|上映日     |string  |             |

### Association
- has_many :Reviews
- has_many :Users through: Reviews
- has_many :Users through: clip
- has_many :clip
- has_many :casts, through: :Movies_Casts
- has_many :Movies_Casts
- has_many :tag, through: :Reviews - Tags
- has_many :Reviews - Tags
- has_many :countries, through: :Movies_Countries
- has_many :Movies_Countries
- has_many :Genres, through: :Movies_Genres
- has_many :Movies_Genres
- has_many :Awards, through: :Movies_Awards
- has_many :Movies_Awards
- has_many :Scriptwrites, through: :Movies_Scriptwrites
- has_many :Movies_Scriptwrites
- has_many :Directors, through: :Movies_Directors
- has_many :Movies_Directors

***

## 3 Reviewsテーブル

|Column|Type|Options|
|------|----|-------|
|comment    |text    |null: false, index: true|
|score      |float   |index: true             |
|User_id    |references |null: false, index: true, foreign_key: true|
|Movie_id   |references |null: false, index: true, foreign_key: true|
|status     |integer |null: false, index: true|

### Association
- has_many : tag
- has_many : comment
- has_many : likes
- belongs_to : User
- belongs_to : Movie

***
## 4 Commentsテーブル

|Column|Type|Options|
|------|----|-------|
|Review_id    |references |null: false, foreign_key: true|
|User_id      |references |null: false, foreign_key: true|
|comment      |string  |null: false|
|status       |integer |null: false|

### Association
- belongs_to : User
- belongs_to : Review
***

## 5 Tagsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true, index: true|

### Association
- has_many :Reviews through: Movies_Tags
- has_many :Movies_Tags
***

## 6 Clipsテーブル

|Column|Type|Options|
|------|----|-------|
|Movie_id |references|null: false, unique: true, foreign_key: true|
|User_id  |references|null: false, unique: true, foreign_key: true|

### Association
- belongs_to :User
- belongs_to :Movie

***

## 7 Likesテーブル

|Column|Type|Options|
|------|----|-------|
|Review_id |references|null: false, foreign_key: true|
|User_id |references|null: false, foreign_key: true|


### Association
- belongs_to : User
- belongs_to : Review

***

## 8 Castsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :Movies through: Movies_Casts
- has_many :Movies_Cast

***
## 9 Countriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :Movies through: Movies_Countries
- has_many :Movies_Countries

***

## 10 Genresテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :Movies through: Movies_Genres
- has_many :Movies_Genres

***

## 11 Awardsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many : Movies through: Movies_Awards
- has_many : Movies_Awards

***

## 12 Relationshipsテーブル

|Column|Type|Options|
|------|----|-------|
|following_id  |integer|null: false, index: true, unique: true|
|follower_id   |integer|null: false, index: true, unique: true|


### Association
- belongs_to :follower, class_name: "User"
- belongs_to :following, class_name: "User

* * *
## ?? Scriptwritesテーブル
|Column|Type|Options|
|------|----|-------|
|Movie_id    |references  |null: false, foreign_key: true|
|Director_id |references  |null: false, foreign_key: true|

### Association
- has_many : Movies through: Movies_Scriptwrites
- has_many : Movies_Scriptwrites

## ?? Directorsテーブル
|Column|Type|Options|
|------|----|-------|
|director |string |null: false, index: true|

### Association
- has_many : Movies through: Movies_Directors
- has_many : Movies_Directors


## 14 Movies_Castsテーブル

|Column|Type|Options|
|------|----|-------|
|Movie_id |references  |null: false ,foreign_key: true|
|Cast_id  |references  |null: false ,foreign_key: true|

### Association
- belongs_to : Movie
- belongs_to : Cast

***

## 15 Movies_Countriesテーブル

|Column|Type|Options|
|------|----|-------|
|Movie_id    |references |null: false, foreign_key: true|
|Country_id  |references |null: false, foreign_key: true|

### Association
- belongs_to : Movie
- belongs_to : Country

***

## 16 Movies_Genresテーブル

|Column|Type|Options|
|------|----|-------|
|Movie_id    |references  |null: false, foreign_key: true|
|Genre_id    |references  |null: false, foreign_key: true|


### Association
- belongs_to : Movie
- belongs_to : Genre

***
## 17 Movies_Awardsテーブル

|Column|Type|Options|
|------|----|-------|
|Movie_id    |references  |null: false, foreign_key: true|
|Award_id    |references  |null: false, foreign_key: true|

### Association
- belongs_to : Movie
- belongs_to : Award

## ?? Movies_Scriptwritersテーブル
|Column|Type|Options|
|------|----|-------|
|Movie_id    |references  |null: false, foreign_key: true|
|Director_id |references  |null: false, foreign_key: true|

### Association
- belongs_to : Movie
- belongs_to : Scriptwriter

## ?? Movies - Directorsテーブル
|Column|Type|Options|
|------|----|-------|
|Movie_id    |references   |null: false, foreign_key: true|
|Director_id |references  |null: false, foreign_key: true|

### Association
- belongs_to : Movie
- belongs_to : Director

## ?? Reviews - Tagsテーブル
|Column|Type|Options|
|Movie_id    |references  |null: false, index: true, foreign_key: true|
|Tag_id      |references  |null: false, index: true, foreign_key: true|

### Association
- belongs_to : Reviews
- belongs_to : Tag
