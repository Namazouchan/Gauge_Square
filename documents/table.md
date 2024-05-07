
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
      string email
      string password_hash
      datetime created_at
      datetime updated_at
    }

    GOALS {
      integer id
      integer user_id
      string title
      text description
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
