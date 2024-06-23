class GoalsController < ApplicationController

    # エラー出てたので、一旦コメントアウト
    # def index
    #   @goals = Goal.all
    # end
  
    def show
    end
  
    def new
      @long_term_goal = LongTermGoal.new
      @mid_term_goal = MidTermGoal.new
    end
  
  def create
    @long_term_goal = LongTermGoal.new(long_term_goal_params)
    mid_term_goals = []
    mid_term_goals << MidTermGoal.new(mid_term_goal_params) if params[:goal][:mid_goal].present?
    mid_term_goals << MidTermGoal.new(mid_term_goal_params_2) if params[:goal][:mid_goal_2].present?
    mid_term_goals << MidTermGoal.new(mid_term_goal_params_3) if params[:goal][:mid_goal_3].present?
    mid_term_goals << MidTermGoal.new(mid_term_goal_params_4) if params[:goal][:mid_goal_4].present?
    mid_term_goals << MidTermGoal.new(mid_term_goal_params_5) if params[:goal][:mid_goal_5].present?

    @long_term_goal.user = current_user
    mid_term_goals.each do |mid_term_goal|
      mid_term_goal.user = current_user
      mid_term_goal.long_term_goal = @long_term_goal
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

    def long_term_goal_params
      params.require(:goal).permit(:long_goal, :long_goal_deadline)
    end
    
    def mid_term_goal_params
      params.require(:goal).permit(:mid_goal, :what_to_do, :why_to_do, :current_status, :why_current_status, :what_next, :mid_goal_deadline, :priority)
    end
    def mid_term_goal_params_2
      params.require(:goal).permit(:mid_goal, :what_to_do, :why_to_do, :current_status, :why_current_status, :what_next, :mid_goal_deadline, :priority)
    end
    def mid_term_goal_params_3
      params.require(:goal).permit(:mid_goal, :what_to_do, :why_to_do, :current_status, :why_current_status, :what_next, :mid_goal_deadline, :priority)
    end
    def mid_term_goal_params_4
      params.require(:goal).permit(:mid_goal, :what_to_do, :why_to_do, :current_status, :why_current_status, :what_next, :mid_goal_deadline, :priority)
    end
    def mid_term_goal_params_5
      params.require(:goal).permit(:mid_goal, :what_to_do, :why_to_do, :current_status, :why_current_status, :what_next, :mid_goal_deadline, :priority)
    end
end
