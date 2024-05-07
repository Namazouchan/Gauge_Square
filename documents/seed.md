# db/seeds.rb

# ユーザー作成
user1 = User.create!(
  name: "田中太郎",
  email: "tanaka@example.com",
  password: "password"
)

user2 = User.create!(
  name: "佐藤花子",
  email: "sato@example.com",
  password: "password"
)

# ユーザー1の長期・中期目標とフィードバック
goal1 = user1.goals.create!(
  long_term_goal: "認知されたソフトウェアエンジニアになる",
  mid_term_goal: "Ruby on Rails を習得する",
  what_to_do: "目標設定アプリを完成させる",
  why_to_do: "フルスタック開発を練習するため",
  current_status: "Rails の基本的な理解",
  why_current_status: "経験が限られている",
  what_next: "アプリに高度な機能を追加する",
  priority: :high,
  deadline: Time.now + 2.months
)

goal2 = user1.goals.create!(
  long_term_goal: "強力な個人ブランドを築く",
  mid_term_goal: "技術ブログを書き、講演を行う",
  what_to_do: "技術会議の準備をする",
  why_to_do: "技術コミュニティでの知名度を高めるため",
  current_status: "適度なプレゼンテーションスキル",
  why_current_status: "時々ブログを書く",
  what_next: "技術会議に提案を提出する",
  priority: :medium,
  deadline: Time.now + 3.months
)

goal1.feedbacks.create!(
  user: user1,
  content: "アプリ開発の進捗が良好です。引き続き頑張りましょう！"
)

goal2.feedbacks.create!(
  user: user1,
  content: "ブログ活動はいいスタートです。続けていきましょう！"
)

# ユーザー2の長期・中期目標とフィードバック
goal3 = user2.goals.create!(
  long_term_goal: "成功した技術系スタートアップを築く",
  mid_term_goal: "スタートアップのMVPを開発する",
  what_to_do: "市場ニーズを把握し、プロダクトロードマップを作成する",
  why_to_do: "業界の重要な問題を解決するため",
  current_status: "潜在的な市場機会を模索中",
  why_current_status: "顧客からのフィードバックが限られている",
  what_next: "市場調査を行い、ロードマップを作成する",
  priority: :high,
  deadline: Time.now + 6.months
)

goal4 = user2.goals.create!(
  long_term_goal: "AI/MLの第一人者になる",
  mid_term_goal: "高度なAI/MLコースを修了する",
  what_to_do: "オンラインのAI/MLプログラムに登録する",
  why_to_do: "機械学習の実践的なスキルを身につけるため",
  current_status: "機械学習の基礎的な概念の理解",
  why_current_status: "入門コースを修了している",
  what_next: "実際の機械学習プロジェクトに取り組む",
  priority: :medium,
  deadline: Time.now + 4.months
)

goal3.feedbacks.create!(
  user: user2,
  content: "しっかりとしたプロダクトのアイデアがありますが、市場調査が必要です。"
)

goal4.feedbacks.create!(
  user: user2,
  content: "コースの進捗は良いので、実践的なプロジェクトを始めましょう！"
)



