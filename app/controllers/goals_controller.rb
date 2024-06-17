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
    @mid_term_goal = MidTermGoal.new(mid_term_goal_params)
    
    # ユーザー情報を設定
    @long_term_goal.user = current_user
    @mid_term_goal.user = current_user
    @mid_term_goal.long_term_goal = @long_term_goal

    if logged_in?
      # トランザクションで保存
      ActiveRecord::Base.transaction do
        @long_term_goal.save!
        @mid_term_goal.save!
      end
      redirect_to goals_path, notice: '目標が作成されました。'
    else
      flash.now[:alert] = 'ログインしてください。'
      render :new
    end
  rescue ActiveRecord::RecordInvalid => e
    flash.now[:alert] = e.message
    render :new
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

    def long_term_goal_params
      params.require(:goal).permit(:long_goal, :long_goal_deadline)
    end
    
    def mid_term_goal_params
      params.require(:goal).permit(:mid_goal, :what_to_do, :why_to_do, :current_status, :why_current_status, :what_next, :mid_goal_deadline, :priority)
    end
end
