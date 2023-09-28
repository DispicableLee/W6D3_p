class UsersController < ApplicationController
    # GET
    # show all users
    def index
        # creates a 'users' object containing all the users in the database
        
        # renders that object into individual json objects to be further manipulated in the views
# debugger
        if params.has_key?(:query)
            user = User.find_by(username: params[:query])
        else
            user = User.all
        end
        render json: user
    end


    # GET
    # show a user by their id
    def show
        # creates a 'user' object by finding a user in the database with the specified id
        user = User.find(params[:id])
        # renders that object into an individual json object to be further manipulated in the views
        render json: user
    end
 
    



    # POST
    # create a new user
    def create
        # creates a new user based on the allowed parameters
        user = User.new(user_params)

        
        if user.save
            #⬆ if the 'user.save' method is successful,  
            #⬇ we redirect the HTTP request to the #index method
            redirect_to users_url(user)
        else
            # if the 'user.save' method is not successful, we render the full message of
            # the '422' error (unprocessable entity) that the 'user' object has
            render user.errors.full_messages, status: 422
        end
    end


    

    # PATCH / PUT
    # update a user's information
    def update
        # creates a 'user' object by finding a user in the database with the specified id
        user = User.find(params[:id])
        if user.update(user_params)
            #⬆ if the 'user.update' method is successful,  
            #⬇ we redirect the HTTP request to the #index method
            redirect_to user_url(user)
        else
            render user.errors.full_message, status: 422
        end
    end


    # DELETE
    # deletes a specific user
    def destroy
        # debugger
        user = User.find_by(id: params[:id])
        if user && user.destroy
            redirect_to users_url
        else
            render json: {'error': 'User does not exist'}
        end
    end

    private


    # the set of possible parameters for any kind of form-data relevent to USERS.
    # useful for POSTing and PATCHing.
    # --- this method can also be used to control what features of the application that 
    # --- specific users are allowed to access, based on some authentication feature.
    # --- more on this later!
    def user_params #create or change
        # because we only have a 'username' column in our 'users' table, we allow 
        # POST and PATCH requests to only opererate on the :username attribute of a user
        params.require(:users).permit(:username)
    end

end
