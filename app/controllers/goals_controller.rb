class GoalsController < ApplicationController

    def index
      @goals = Goal.all
    end
  
    def show
    end
  
    def new
      @long_term_goal = LongTermGoal.new
      @mid_term_goal = MidTermGoal.new
    end
  
    def create
      long_term_goal_params = params.require(:goals).permit(:long_goal, :long_goal_deadline)
      mid_term_goal_params = params.require(:goals).permit(:mid_goal, :what_to_do, :why_to_do, :current_status, :why_current_status, :what_next, :mid_goal_deadline, :priority)
      @long_term_goal = LongTermGoal.new(long_term_goal_params)
      @mid_term_goal = MidTermGoal.new(mid_term_goal_params)
      if logged_in?
        @long_term_goal.save
        @mid_term_goal.save
        redirect_to goals_path, notice: '目標が作成されました。'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @goal.update(goal_params)
        redirect_to @goal, notice: '目標が更新されました。'
      else
        render :edit
      end
    end
  
    def destroy
      @goal.destroy
      redirect_to goals_path, notice: '目標が削除されました。'
    end
  
    private
  
    def set_goal
      @goal = Goal.find(params[:id])
    end
  
    def goal_params
      params.require(:goal).permit(
        :long_term_goal, :mid_term_goal, :what_to_do, :why_to_do,
        :current_status, :why_current_status, :what_next, :priority, :deadline
      )
    end
end
