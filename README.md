# README

## 1 Usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|email|string|null: false, unique: true|

### Association
- has_many :xxx
- belongs_to :xxx

***

## 2 Moviesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, uniqu:true|

### Association
- has_many :xxx
- belongs_to :xxx

***

## 3 Reviewsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :xxx
- belongs_to :xxx

***

## 4 Commentsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

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
|name|string|null: false, unique: true|

### Association
- has_many :xxx
- belongs_to :xxx

***

## 7 Likesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :xxx
- belongs_to :xxx

***

## 8 Castsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :xxx
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
|name|string|null: false, unique: true|

### Association
- has_many :xxx
- belongs_to :xxx

* * *
_ 以下、中間テーブル _
* * *

## 13 Users_Castsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :xxx
- belongs_to :xxx

***

## 14 Movies_Castsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :xxx
- belongs_to :xxx

***

## 15 Movies_Countriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :xxx
- belongs_to :xxx

***

## 16 Movies_Genresテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :xxx
- belongs_to :xxx

***

## 17 Movies_Awardsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :xxx
- belongs_to :xxx
