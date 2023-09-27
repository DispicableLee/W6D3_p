class UsersController < ApplicationController
    # GET
    # show all users
    def index
        users = User.all
        render json: users
    end


    # GET
    # show a user by their id
    def show
        user = User.find(params[:id])
        render json: user
    end




    # POST
    # create a new user
    def create
        user = User.new(user_params)

        if user.save
            #render json:user
            redirect_to users_url(user)
        else
            render user.errors.full_messages, status: 422
        end
    end


    

    # PATCH / PUT
    # update a user's information
    def update
        user = User.find(params[:id])
        if user.update(user_params)
            redirect_to user_url(user)
        else
            render user.errors.full_message, status: 422
        end
    end


    # DELETE
    # deletes a specific user
    def destroy
        user = User.find_by(id: params[:id])
        if user && user.destroy
            redirect_to user_url
        else
            render json: {'error': 'User does not exist'}
        end
    end


    def user_params #create or change
        params.require(:user).permit(:username, :email)
    end

end
