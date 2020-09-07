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
|     Column     |    Type    |   Options   |
| -------------- | ---------- | ----------- |
|     nickname   |   string   | null: false |
|     password   |   string   | null: false |
| password_confirmation | string | null: false |

### Association
- has_many :incomes
- has_many :outgos
- has_one :goal

## incomes テーブル
|  Column  |    Type    |   Options   |
| -------- | ---------- | ----------- |
|   price  |   integer  | null: false |
| description |  text   | null: false |
|   date   |    date    | null: false |
|   user   | references | null: false, foreign_key: true |

### Association
- belongs_to :user

## outgos テーブル
|  Column  |    Type    |   Options   |
| -------- | ---------- | ----------- |
|   price  |   integer  | null: false |
| description |  text   | null: false |
|   date   |    date    | null: false |
|   user   | references | null: false, foreign_key: true |

### Association
- belongs_to :user

## goals テーブル
|  Column |  Type  |   Options   |
| ------- | ------ | ----------- |
|   text  |  text  |
|   user  | references | null: false, foreign_key: true | 

### Association
- belongs_to :user