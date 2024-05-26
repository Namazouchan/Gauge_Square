class UsersController < ApplicationController
    # GET /users/:id
    def show
        @user = User.find(params[:id])
    end

    # GET /users/new
    def new
        # app/views/users/new.html.erb
    end
end