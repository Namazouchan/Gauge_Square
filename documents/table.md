
# テーブル要件と設計
## テーブル構造

Users - ユーザーの情報を保持するテーブル  
Goals - 各ユーザーの目標を保持するテーブル  
Feedbacks - 目標に対するフィードバックを保持するテーブル  

## テーブル詳細

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
