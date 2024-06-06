# テーブル要件と設計
## テーブル構造

Users - ユーザーの情報を保持するテーブル  
Long_term_goals - 各ユーザーの目標を保持するテーブル  
Mid_term_goals - 各ユーザーの目標を保持するテーブル  
Feedbacks - 目標に対するフィードバックを保持するテーブル  

## テーブル詳細

#### Users テーブル

| カラム名         | データ型   | 制約             | 説明                |
|-----------------|-----------|-----------------|---------------------|
| `id`            | integer   | Primary Key     | ユーザーID          |
| `name`          | string    | Not Null        | ユーザーの名前       |
| `password_hash` | string    | Not Null        | ハッシュ化されたパスワード |
| `created_at`    | datetime  | Not Null        | 作成日時            |
| `updated_at`    | datetime  | Not Null        | 更新日時            |

#### Long_term_goals テーブル

| カラム名            | データ型   | 制約         | 説明                                        |
|---------------------|-----------|-------------|---------------------------------------------|
| `id`                | integer   | Primary Key | 目標ID                                     |
| `user_id`           | integer   | Foreign Key | 関連するユーザーID                         |
| `long_goal`         | string    | Not Null    | 長期的な目標                               |
| `deadline`          | datetime  |             | 目標の締め切り日時                         |
| `is_complete`       | boolean   | Not Null    | default: false true: complete            |
| `created_at`        | datetime  | Not Null    | 作成日時                                   |
| `updated_at`        | datetime  | Not Null    | 更新日時                                   |

#### Mid_term_goals テーブル

| カラム名            | データ型   | 制約         | 説明                                        |
|---------------------|-----------|-------------|---------------------------------------------|
| `id`                | integer   | Primary Key | 目標ID                                     |
| `user_id`           | integer   | Foreign Key | 関連するユーザーID                         |
| `long_term_goal_id` | integer   | Foreign Key | 関連する長期的な目標ID                     |
| `mid_goal`          | string    | Not Null    | 中期的な目標                               |
| `what_to_do`        | text      |             | 何をするのか                               |
| `why_to_do`         | text      |             | なぜそれを行うのか                         |
| `current_status`    | text      |             | 現状どうなのか                             |
| `why_current_status`| text      |             | なぜ現状がそうなっているのか               |
| `what_next`         | text      |             | では何をするのか                           |
| `priority`          | integer   | Not Null    | 1: low, 2: medium, 3: high                 |
| `deadline`          | datetime  |             | 目標の締め切り日時                         |
| `is_complete`       | boolean   | Not Null    | default: false true: complete            |
| `created_at`        | datetime  | Not Null    | 作成日時                                   |
| `updated_at`        | datetime  | Not Null    | 更新日時                                   |

#### Feedbacks テーブル

| カラム名            | データ型   | 制約         | 説明                     |
|---------------------|-----------|-------------|--------------------------|
| `id`                | integer   | Primary Key | フィードバックID         |
| `long_term_goal_id` | integer   | Foreign Key | 関連する長期目標ID       |
| `mid_term_goal_id`  | integer   | Foreign Key | 関連する中期目標ID       |
| `user_id`           | integer   | Foreign Key | フィードバックを残したユーザーID |
| `content`           | text      | Not Null    | フィードバック内容       |
| `created_at`        | datetime  | Not Null    | 作成日時                 |
| `updated_at`        | datetime  | Not Null    | 更新日時                 |


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
        integer long_term_goal_id FK
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
