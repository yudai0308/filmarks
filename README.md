# README

## 1 Usersテーブル

|Column|Type|Options|
|------|----|-------|
|ID         |integer|null: false, unique: true, index: true|
|E-mail     |string |null: false                           |
|password   |string |null: false                           |
|nickname   |string |null: false, index: true              |
|image      |text   |                                      |
|comment    |text   |                                      |

### Association
- has_many : Reviews
- has_many : likes
- has_many : comments
- has_many : Relationships through:?
- has_many : Movies through: clip


## 2 Moviesテーブル

|Column|Type|Options|
|------|----|-------|
|title     |string  |null: false, index: true|
|subtitle  |string  |             |
|image     |text    |             |
|上映時間   |string? |             |
|あらすじ   |text    |             |
|製作年     |string  |             |
|上映日     |string  |             |
|映画情報   |text    |             |
|予告編検索 |text    |             |

### Association
- has_many : Reviews
- has_many : Users through: clip
- has_many : clip
- has_many : casts through: Movies_Casts
- has_many : *** through:
- has_many : *** through:


- belongs_to :xxx

***

## 3 Reviewsテーブル

|Column|Type|Options|
|------|----|-------|
|comment    |text    |null: false, index: true|
|score      |integer |index: true             |
|User_id    |integer |null: false, index: true|
|Movie_id   |integer |null: false, index: true|
|status     |integer |null: false, index: true|
statusは、ネタバレ用

### Association
- has_many :xxx
- belongs_to :xxx

***
## 4 Commentsテーブル

|Column|Type|Options|
|------|----|-------|
|Review_id    |integer |null: false|
|User_id      |integer |null: false|
|comment      |string  |null: false|
|status       |integer |           |

### Association
- has_many :xxx
- belongs_to :xxx

***

## 5 Tagsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :xxx
- belongs_to :xxx

***

## 6 Clipsテーブル

|Column|Type|Options|
|------|----|-------|
|Movie_id |string|null: false, unique: true|
|User_id  |string|null: false, unique: true|

### Association
- belongs_to :Users
- belongs_to :Movies

***

## 7 Likesテーブル

|Column|Type|Options|
|------|----|-------|
|Review_id|string|null: false|
|User_id|string|null: false|


### Association
- has_many :xxx
- belongs_to :xxx

***

## 8 Castsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many : Movies through: Movies_Cast
- belongs_to :xxx

***

## 9 Countriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :xxx
- belongs_to :xxx

***

## 10 Genresテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :xxx
- belongs_to :xxx

***

## 11 Awardsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :xxx
- belongs_to :xxx

***

## 12 Relationshipsテーブル

|Column|Type|Options|
|------|----|-------|
|following  |integer|null: false, index: true|
|follower   |integer|null: false, index: true|

### Association
- has_many :xxx
- belongs_to :xxx

* * *
## ?? Scriptwritesテーブル
|Column|Type|Options|
|------|----|-------|
|Movie_id    |integer  |null: false|
|Director_id |integer  |null: false|

### Association
- has_many :xxx
- belongs_to :xxx

## ?? Directorsテーブル
|Column|Type|Options|
|------|----|-------|
|director |string |null: false, index: true|

### Association
- has_many :xxx
- belongs_to :xxx

<!-- _ 以下、中間テーブル _ -->
* * *
<!--
## 13 Users_Castsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :xxx
- belongs_to :xxx
 -->
***

## 14 Movies_Castsテーブル

|Column|Type|Options|
|------|----|-------|
|Movie_id |integer  |null: false|
|Cast_id  |integer  |null: false|

### Association
- has_many :xxx
- belongs_to :xxx

***

## 15 Movies_Countriesテーブル

|Column|Type|Options|
|------|----|-------|
|Movie_id    |integer  |null: false|
|Country_id  |integer  |null: false|

### Association
- has_many :xxx
- belongs_to :xxx

***

## 16 Movies_Genresテーブル

|Column|Type|Options|
|------|----|-------|
|Movie_id    |integer  |null: false|
|Genre_id    |integer  |null: false|


### Association
- has_many :xxx
- belongs_to :xxx

***
## 17 Movies_Awardsテーブル

|Column|Type|Options|
|------|----|-------|
|Movie_id    |integer  |null: false|
|Award_id    |integer  |null: false|

### Association
- has_many :xxx
- belongs_to :xxx

## ?? Movies_Scriptwritersテーブル
|Column|Type|Options|
|------|----|-------|
|Movie_id    |integer  |null: false|
|Director_id |integer  |null: false|

### Association
- has_many :xxx
- belongs_to :xxx

## ?? Movies - Directorsテーブル
|Column|Type|Options|
|------|----|-------|
|Movie_id    |integer  |null: false|
|Director_id |integer  |null: false|

### Association
- has_many :xxx
- belongs_to :xxx

## ?? Movies - Tagsテーブル
|Column|Type|Options|
|Movie_id    |integer |null: false, index: true|
|Tag_id      |integer |null: false, index: true|

### Association
- has_many :xxx
- belongs_to :xxx
