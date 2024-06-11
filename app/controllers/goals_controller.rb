class GoalsController < ApplicationController
    before_action :set_goal, only: [:show, :edit, :update, :destroy]

    def index
      @goals = Goal.all
    end
  
    def show
    end
  
    def new
      # @goal = Goal.new
    end
  
    def create
      @goal = Goal.new(goal_params)
      @goal.user = User.first # 本来はログインユーザーに変更すべき
      if @goal.save
        redirect_to @goal, notice: '目標が作成されました。'
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
