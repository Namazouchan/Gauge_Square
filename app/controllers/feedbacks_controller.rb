class FeedbacksController < ApplicationController
    before_action :set_goal

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
      @goal = Goal.find(params[:goal_id])
    end
  
    def feedback_params
      params.require(:feedback).permit(:content)
    end
end
