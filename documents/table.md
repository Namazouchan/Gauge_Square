
# テーブル要件と設計
## テーブル構造

Users - ユーザーの情報を保持するテーブル  
Goals - 各ユーザーの目標を保持するテーブル  
Feedbacks - 目標に対するフィードバックを保持するテーブル  

## テーブル詳細
#### Goals　テーブル

| カラム名            | データ型   | 制約         | 説明                                        |
|---------------------|-----------|-------------|---------------------------------------------|
| `id`                | integer   | Primary Key | 目標ID                                     |
| `user_id`           | integer   | Foreign Key | 関連するユーザーID                         |
| `long_term_goal`    | string    |             | 長期的な目標                               |
| `mid_term_goal`     | string    |             | 中期的な目標                               |
| `what_to_do`        | text      |             | 何をするのか                               |
| `why_to_do`         | text      |             | なぜそれを行うのか                         |
| `current_status`    | text      |             | 現状どうなのか                             |
| `why_current_status`| text      |             | なぜ現状がそうなっているのか               |
| `what_next`         | text      |             | では何をするのか                           |
| `priority`          | integer   | Not Null    | 優先順位（`enum`型として`low`, `medium`, `high`）|
| `deadline`          | datetime  |             | 目標の締め切り日時                         |
| `created_at`        | datetime  | Not Null    | 作成日時                                   |
| `updated_at`        | datetime  | Not Null    | 更新日時                                   |


#### Users テーブル

| カラム名         | データ型   | 制約             | 説明                |
|-----------------|-----------|-----------------|---------------------|
| `id`            | integer   | Primary Key     | ユーザーID          |
| `name`          | string    | Not Null        | ユーザーの名前       |
| `password_hash` | string    | Not Null        | ハッシュ化されたパスワード |
| `created_at`    | datetime  | Not Null        | 作成日時            |
| `updated_at`    | datetime  | Not Null        | 更新日時            |

#### Feedbacks テーブル

| カラム名      | データ型   | 制約         | 説明                     |
|---------------|-----------|-------------|--------------------------|
| `id`          | integer   | Primary Key | フィードバックID         |
| `goal_id`     | integer   | Foreign Key | 関連する目標ID           |
| `user_id`     | integer   | Foreign Key | フィードバックを残したユーザーID |
| `content`     | text      | Not Null    | フィードバック内容       |
| `created_at`  | datetime  | Not Null    | 作成日時                 |
| `updated_at`  | datetime  | Not Null    | 更新日時                 |


```mermaid
---
title: "Gauge_Square"
---
erDiagram
    USERS ||--o{ GOALS : "has"
    GOALS ||--o{ FEEDBACKS : "has"
    USERS ||--o{ FEEDBACKS : "provides"

    USERS {
      integer id
      string name
      string password_hash
      datetime created_at
      datetime updated_at
    }

    GOALS {
      integer id
      integer user_id
      string long_term_goal
      string mid_term_goal
      text what_to_do
      text why_to_do
      text current_status
      text why_current_status
      text what_next
      integer priority
      datetime deadline
      datetime created_at
      datetime updated_at
    }

    FEEDBACKS {
      integer id
      integer goal_id
      integer user_id
      text content
      datetime created_at
      datetime updated_at
    }

