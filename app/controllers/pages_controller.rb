class PagesController < ApplicationController
  def home
    if current_user
      @goals_data = MidTermGoal.where(user_id: current_user.id, is_complete: true)
                              .group_by_month(:created_at, format: "%Y年%m月")
                              .count
    else
      @goals_date = {}
    end
      puts "@goals_data: #{@goals_data.inspect}"
  end
  
end
