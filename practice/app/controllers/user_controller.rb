class UsersController < ApplicationController
    def index
        users = User.all
        render json: users
    end
    def user_params #create or change
        params.require(:user).permit(:body, :author_id)
    end
    def create
        user = User.new(user_params)

        if user.save
            #render json:user
            redirect_to user_url(user)
        else
            render user.errors.full_messages, status: 422
        end
    end
end
