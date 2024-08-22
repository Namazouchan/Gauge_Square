# Gauge_Square
![Readme画像①](https://github.com/user-attachments/assets/bbb69363-b5b6-4ca9-ad6e-19b1f8f03013)

## サービスコンセプト
掲げている夢や希望を実現する手助け!!エンゲージメント向上!!が出来るアプリ

### 誰のどんな課題を解決するのか？
#### 「理想の自分に近づいているかわからなくて不安」という課題

### なぜそれを解決したいのか？
#### ①今の仕事や行動が、目指したい目標に向かっているのか確認したい！
仕事のとの向き合い方、向き合い方などを間違っていないかどうか確認したい。軌道修正が出来る機会が少なかった。  
目標も無く、仕事ではなく作業をしていた過去がありました。  
それは、自己目標を設定していなかった。ことが原因だと考えています。  
期間を決め自己目標を設定すれば、「理想の自分に近づいているかわからなくて不安」という課題は解消できると思っています。
#### ②エンゲージメントを高め 高い生産性と低い離職率を実現したい！
私は過去に、正社員とアルバイト合わせて30人のチームリーダー（主任）として、まとめていた経験があります。  
離職率が高く、私は離職率を下げるために定期的に面談の時間を設け、1対1の時間を作っていました。  
当時私はエクセルや紙ベースで管理していた為、煩雑で管理する時間を業務時間外にしたりと、大変苦労した記憶があります。
個人で目標を管理することが出来れば、各メンバーのエンゲージメントを高め 高い生産性と低い離職率を両立できると思っています。
### どうやって解決するのか？
#### 各メンバーのエンゲージメントを高め 高い生産性と低い離職率を実現
従業員が自分の仕事に情熱を持ち自己決定した目標に向かって仕事と向き合えることが出来るので、効率的にタスクをこなし、高い成果を出せる。  
結果、職場の雰囲気が良くなり、協力的なチームワークが促進され良好な職場環境になり低い離職率を実現することが出来る。

## 機能要件
ユーザ登録機能  
目標設定機能  
長期的目標に対し、複数の中期目標を設定出来る。  
自己フィードバック  
達成した目標を確認出来る。  

## こだわったところ
直観的な操作でアプリを使用出来る  
面倒なユーザー登録は必要項目を最小限にした  
長期的な目標に対し、中期的な目標を複数掲げることが出来る点  

## 今後の課題及び追加予定機能
管理者権限をもったアカウントの作成  
上長からのフィードバック

## 非機能要件 
GitHubのmainブランチにマージしたら自動デプロイ  

## 使用技術
<img src="https://img.shields.io/badge/-Ruby-CC342D.svg?logo=ruby&style=plastic"> <img src="https://img.shields.io/badge/-Ruby%20on%20Rails-CC0000.svg?logo=rails&style=plastic"> <img src="https://img.shields.io/badge/-Javascript-F7DF1E.svg?logo=javascript&style=plastic"> <img src="https://img.shields.io/badge/-Html5-E34F26.svg?logo=html5&style=plastic"> <img src="https://img.shields.io/badge/-Css3-1572B6.svg?logo=css3&style=plastic"> <img src="https://img.shields.io/badge/-Postgresql-336791.svg?logo=postgresql&style=plastic"> <img src="https://img.shields.io/badge/-Render-000000.svg?logo=&style=plastic">

## ER図

```mermaid
---
title: "Gauge_Square"
---
erDiagram
    USERS {
        integer id PK
        string name
        string password_hash
        datetime created_at
        datetime updated_at
    }

    LONG_TERM_GOALS {
        integer id PK
        integer user_id FK
        string long_goal
        datetime deadline
        boolean is_complete
        datetime created_at
        datetime updated_at
    }
    
    MID_TERM_GOALS {
        integer id PK
        integer user_id FK
        integer long_term_goal_id FK
        string mid_goal
        text what_to_do
        text why_to_do
        text current_status
        text why_current_status
        text what_next
        integer priority
        datetime deadline
        boolean is_complete
        datetime created_at
        datetime updated_at
    }

    FEEDBACKS {
        integer id PK
        integer mid_term_goal_id FK
        integer user_id FK
        text content
        datetime created_at
        datetime updated_at
    }

    USERS ||--o{ LONG_TERM_GOALS : has
    USERS ||--o{ MID_TERM_GOALS : has
    LONG_TERM_GOALS ||--o{ MID_TERM_GOALS : includes
    USERS ||--o{ FEEDBACKS : provides
    LONG_TERM_GOALS ||--o{ FEEDBACKS : receives
    MID_TERM_GOALS ||--o{ FEEDBACKS : receives  
