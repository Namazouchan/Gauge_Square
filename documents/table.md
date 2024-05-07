
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


## シードデータ例
以下は、ユーザーと目標のサンプルデータを生成するシードデータの例です。これを db/seeds.rb に記述して実行することで、データベースにサンプルデータが追加される。
# db/seeds.rb

# ユーザー作成
user1 = User.create!(
  name: "Jane Smith",
  email: "jane@example.com",
  password: "password"
)

user2 = User.create!(
  name: "John Doe",
  email: "john@example.com",
  password: "password"
)

# ユーザー1の長期・中期目標とフィードバック
goal1 = user1.goals.create!(
  long_term_goal: "Become a recognized software engineer",
  mid_term_goal: "Learn and master Ruby on Rails",
  what_to_do: "Complete a goal-setting app",
  why_to_do: "To practice full-stack development",
  current_status: "Basic understanding of Rails",
  why_current_status: "Limited experience",
  what_next: "Build advanced features in the app",
  priority: :high,
  deadline: Time.now + 2.months
)

goal2 = user1.goals.create!(
  long_term_goal: "Build a strong personal brand",
  mid_term_goal: "Write technical blogs and give talks",
  what_to_do: "Prepare for tech conferences",
  why_to_do: "To increase visibility in the tech community",
  current_status: "Moderate public speaking skills",
  why_current_status: "Occasionally writes blogs",
  what_next: "Submit proposals to tech conferences",
  priority: :medium,
  deadline: Time.now + 3.months
)

goal1.feedbacks.create!(
  user: user1,
  content: "Making good progress with the app development."
)

goal2.feedbacks.create!(
  user: user1,
  content: "Good start with the blogging efforts. Keep it up!"
)

# ユーザー2の長期・中期目標とフィードバック
goal3 = user2.goals.create!(
  long_term_goal: "Build a successful tech startup",
  mid_term_goal: "Develop an MVP for the startup",
  what_to_do: "Identify market needs and create a product roadmap",
  why_to_do: "To solve significant problems in the industry",
  current_status: "Exploring potential market opportunities",
  why_current_status: "Limited customer feedback",
  what_next: "Conduct market research and create a roadmap",
  priority: :high,
  deadline: Time.now + 6.months
)

goal4 = user2.goals.create!(
  long_term_goal: "Become a leading expert in AI/ML",
  mid_term_goal: "Complete advanced AI/ML courses",
  what_to_do: "Enroll in online AI/ML programs",
  why_to_do: "To gain practical skills in machine learning",
  current_status: "Basic understanding of machine learning concepts",
  why_current_status: "Completed introductory courses",
  what_next: "Work on real-world machine learning projects",
  priority: :medium,
  deadline: Time.now + 4.months
)

goal3.feedbacks.create!(
  user: user2,
  content: "Solid product idea. Need more market research."
)

goal4.feedbacks.create!(
  user: user2,
  content: "Good progress with the courses. Start practical projects!"
)



