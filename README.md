# Gauge_Square
![Readme画像①](https://github.com/user-attachments/assets/bbb69363-b5b6-4ca9-ad6e-19b1f8f03013)
## テーマ
掲げている夢や希望を実現する手助け!!エンゲージメント向上!!が出来るアプリ
  
## 誰のどんな課題を解決するのか？
#### 「理想の自分に近づいているかわからなくて不安」という課題
  
## なぜそれを解決したいのか？
#### ①今の仕事や行動が、目指したい目標に向かっているのか確認したい！
仕事のとの向き合い方、向き合い方などを間違っていないかどうか確認したい。軌道修正が出来る機会が少なかった。  
目標も無く、仕事ではなく作業をしていた過去がありました。  
それは、自己目標を設定していなかった。ことが原因だと考えています。  
期間を決め自己目標を設定すれば、「理想の自分に近づいているかわからなくて不安」という課題は解消できると思っています。
#### ②エンゲージメントを高め 高い生産性と低い離職率を実現したい！
私は過去に、正社員とアルバイト合わせて30人のチームリーダー（主任）として、まとめていた経験があります。  
離職率が高く、私は離職率を下げるために定期的に面談の時間を設け、1対1の時間を作っていました。  
当時私はエクセルや紙ベースで管理していた為、煩雑で管理する時間を業務時間外にしたりと、大変苦労した記憶があります。
個人で目標を管理することが出来れば、各メンバーのエンゲージメントを高め 高い生産性と低い離職率を両立できると思っていアプリを作成しました。
  
## どうやって解決するのか？
#### 各メンバーのエンゲージメントを高め 高い生産性と低い離職率を実現
従業員が自分の仕事に情熱を持ち自己決定した目標に向かって仕事と向き合えることが出来るので、効率的にタスクをこなし、高い成果を出せる。  
結果、職場の雰囲気が良くなり、協力的なチームワークが促進され良好な職場環境になり低い離職率を実現することが出来る。

## 機能一覧
### ログイン画面
使いやすいデザインに仕上げたログイン画面です。ユーザー登録にはユーザ名とパスワードのみで登録することが可能です。  
  
![2707F0E5-10E7-4DED-A480-57E6CE5E9B3C](https://github.com/user-attachments/assets/c9712d33-c289-46f1-a029-f3cf3d72d699)  
### 目標設定ページ
ユーザーが長期および中期の目標を設定できるページです。目標には期限や優先度を設定し、具体的な行動計画を立てることが可能です。  
  
![EBC917CB-5702-4C33-B950-450847A79C40](https://github.com/user-attachments/assets/e5bc4961-ae79-4844-b891-fa013c7c77d5)  
### フィードバック入力ページ
各目標に対するフィードバックを入力できるページです。ユーザーは達成した目標や進行中の目標に対して、コメントを残すことができます。  
  
![34FD1633-D236-4CF1-8206-62F7652FEF0E](https://github.com/user-attachments/assets/b7307f80-106f-40be-89d5-58ee5d036005)  

![AF7C50E4-DB0C-46F8-B0CA-3D6694130E5E](https://github.com/user-attachments/assets/2c1b1341-dfe5-449f-b039-031d4f679aa7)  
### 過去に達成した目標リスト
ユーザーが過去に達成した目標の一覧を表示するページです。ここからユーザーは自分の成長と達成を振り返ることができます。  
  
![8650F74D-4BB6-4CD4-916F-38A26050F265](https://github.com/user-attachments/assets/d2dd16e5-b6c9-4347-8e2f-c3e8009d5165)  


## 機能要件
ユーザ登録機能  
　ユーザーは新規アカウントを作成できます。  
目標設定機能  
　ユーザーは新しい目標を作成でき、設定された目標の一覧を確認、目標内容を編集、削除することが可能です。  
長期的目標に対し、複数の中期目標を設定できる  
自己フィードバック  
　中期目標に対して自己フィードバックを作成でき、過去のフィードバックを確認できます。  
達成した目標を確認できる  
　ユーザーは完了した目標の一覧を確認（Read）し、詳細を閲覧できます。

## こだわったところ
直観的な操作でアプリを使用出来る  
面倒なユーザー登録は必要項目を最小限にした  
長期的な目標に対し、中期的な目標を複数掲げることが出来る点  
過去達成した目標数をグラフで見ることができる点  

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
