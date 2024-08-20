class GoalsController < ApplicationController
    before_action :authenticate_user! # ログインしていない場合アクセスを制限
    before_action :set_goal, only: [:edit, :update, :destroy]

    def index
      @long_term_goals = current_user.long_term_goals
      @mid_term_goals = current_user.mid_term_goals
      @goals_data = MidTermGoal.where(is_complete: true)
                               .group_by_month(:created_at, format: "%Y年%m月")
                               .count
    end

    def update
      if @goal.update(goal_params)
        redirect_to goalindex_path, notice: '目標が更新されました'
      else
        render :edit
      end
    end

    def edit
    end
  
    def show
    end

    def destroy
      @goal.destroy
      redirect_to goal_path, notice: '目標は削除されました。'
    end
  
    def new
      @long_term_goal = LongTermGoal.new
      @mid_term_goal = MidTermGoal.new
    end

    def create
      @long_term_goal = LongTermGoal.new(long_term_goal_params)
      @long_term_goal.user = current_user
      
      mid_term_goals = []

      # 受け取ったパラメータを処理
      (1..5).each do |i|
        if params[:goal]["mid_goal_#{i}"].present?
          mid_term_goal = MidTermGoal.new(
            mid_goal: params[:goal]["mid_goal_#{i}"],
            what_to_do: params[:goal]["what_to_do_#{i}"],
            why_to_do: params[:goal]["why_to_do_#{i}"],
            current_status: params[:goal]["current_status_#{i}"],
            why_current_status: params[:goal]["why_current_status_#{i}"],
            what_next: params[:goal]["what_next_#{i}"],
            mid_goal_deadline: params[:goal]["mid_goal_deadline_#{i}"],
            priority: params[:goal]["priority_#{i}"]
          )
          mid_term_goal.user = current_user
          mid_term_goal.long_term_goal = @long_term_goal
          mid_term_goals << mid_term_goal
        end
      end

      if logged_in?
        # トランザクションで保存
        ActiveRecord::Base.transaction do
          @long_term_goal.save!
          mid_term_goals.each(&:save!)
        end
        redirect_to goals_path, notice: '目標が作成されました。'
      else
        flash.now[:alert] = 'ログインしてください。'
        render :new, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordInvalid => e
      flash.now[:alert] = e.message
      render :new
    end

    private

    def set_goal
      @goal = if params[:type] == 'long_term'
        LongTermGoal.find(params[:id])
      else
        MidTermGoal.find(params[:id])
      end
    end

    def goal_params
      if params[:type] == 'long_term'
        params.require(:long_term_goal).permit(:long_goal, :long_goal_deadline)
      else
        params.require(:mid_term_goal).permit(:mid_goal, :what_to_do, :why_to_do, :current_status, :why_current_status, :what_next, :priority, :mid_goal_deadline)
      end
    end

    def long_term_goal_params
      params.require(:goal).permit(:long_goal, :long_goal_deadline)
    end

    def mid_term_goal_params(index)
      params.require(:goal).permit(
        "mid_goal_#{index}",
        "what_to_do_#{index}",
        "why_to_do_#{index}",
        "current_status_#{index}",
        "why_current_status_#{index}",
        "what_next_#{index}",
        "mid_goal_deadline_#{index}",
        "priority_#{index}"
      )
    end 
end