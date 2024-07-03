class FeedbacksController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_goal

    def index
      @long_term_goals = current_user.long_term_goals
      @mid_term_goals = current_user.mid_term_goals
    end

    def edit
    end

    def show
      @long_term_goals = current_user.long_term_goals
      @mid_term_goals = current_user.mid_term_goals
      @feedbacks = current_user.feedbacks
    end

    def new
      @feedback = @goal.feedbacks.build
    end

    def update
      if @goal.update(feedback_params)
        redirect_to feedbacks_path, notice: 'フィードバックが入力されました'
      end
    end

    def create
      @feedback = @goal.feedbacks.build(feedback_params)
      @feedback.user = current_user
  
      if @feedback.save
        update_mid_goal_complete
        redirect_to @goal, notice: 'フィードバックが正常に作成されました。'
      else
        render :new
      end
    end
  
    private
  
    def set_goal
      params[:mid_term_goal_id]
      @goal = MidTermGoal.find_by(id: params[:mid_term_goal_id])
    end
  
    def feedback_params
      params.require(:feedback).permit(:content)
    end

    def update_mid_goal_complete
      if @goal.is_a?(MidTermGoal)
        @goal.update(is_complete: true)
      end
    end
end
