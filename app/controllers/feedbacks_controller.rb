class FeedbacksController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_goal

    def index
      # @long_term_goals = current_user.long_term_goals
      @mid_term_goals = current_user.mid_term_goals
    end

    def edit
    end

    def update
      if @goal.update(feedback_params)
        redirect_to feedbacks_path, notice: 'フィードバックが入力されました'
      end
    end

    def create
      @feedback = @goal.feedbacks.build(feedback_params)
      @feedback.user = User.first # 本来はログインユーザーに変更すべき
      if @feedback.save
        redirect_to @goal, notice: 'フィードバックが追加されました。'
      else
        redirect_to @goal, alert: 'フィードバックの追加に失敗しました。'
      end
    end
  
    def destroy
      @feedback = @goal.feedbacks.find(params[:id])
      @feedback.destroy
      redirect_to @goal, notice: 'フィードバックが削除されました。'
    end
  
    private
  
    def set_goal
      @goal = if params[:type] == 'long_term'
        LongTermGoal.find(params[:id])
      else
        MidTermGoal.find(params[:id])
      end
    end
  
    def feedback_params
      if params[:type] == 'long_term'
        params.require(:long_term_goal).permit(:long_term_goal, :long_goal_deadline)
      else
        params.require(:mid_term_goal).permit(:mid_term_goal, :mid_goal_deadline)
      end
    end

end
