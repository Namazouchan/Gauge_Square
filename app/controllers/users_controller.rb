class UsersController < ApplicationController
    # GET /users/:id
    def show
        @user = User.find(params[:id])
    end

    # GET /users/new or /signup
    def new
        @user = User.new
        # app/views/users/new.html.erb
    end

    def create
        @user = User.new(user_params)
        if @user.save
          log_in @user
          redirect_to root_path, notice: 'ユーザーが作成されました'
        else
          render :new
        end
      end
    
      private
    
      def user_params
        params.require(:user).permit(:name, :password)
      end
      
end