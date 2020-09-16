# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# テーブル設計		
		
		## users テーブル
		
		| Column    | Type    | Options     |
		| --------  | ------  | ----------- |
		｜nickname | string | null: false |
		| first_name  | string  | null: false |
		| last_name     | string  | null: false |
		| first_name_kana  | string  | null: false |
		| last_name_kana | string  |  null: false |
		| email      | string       |  null: false |
		| encrypted_password   | string       | null: false |
		｜birth_day  ｜ date        | null: false |
		
		### Association
		
		- has_many :items
		- has_many :purchases
		
		## items テーブル
		
		| Column    | Type    | Options     |
		| --------  | ------  | ----------- |
		| user  | references  | null: false, foreign_key: true |
		| name      | string  | null: false |
		| price     | integer  | null: false |
		| introduction | text | null: false |
		| category_id | integer | null: false |
		| status_id | integer | null: false|
		| shipping_fee_id | integer | null: false |
		| shipping_days_id | integer | null: false |	
		| prefecture_id | string | null: false |
	
		
		
		
		### Association
		
		- belongs to :user
		- has_one :purchase
		
		##  purchases テーブル
		
		| Column    | Type    | Options     |
		| --------  | ------  | ----------- |
		| item | references  | null: false, foreign_key: true |
		| user     | references  | null: false, foreign_key: true |
		
		###  Association;
		
		- belongs to :user
		- belongs to :item
		- has_one :delivery address
		
		##  delivery address  テーブル
		
		| Column    | Type    | Options     |
		| --------  | ------  | ----------- |
		| postal code  | string  | null: false |
		| prefecture     | integer  | null: false |
		| city | string  | null: false |
		| block_number | string | null: false |
		| building_name | string |  |
		| phone_number | string  | null: false |
		
		###  Association
		
		- belongs to :purchase
