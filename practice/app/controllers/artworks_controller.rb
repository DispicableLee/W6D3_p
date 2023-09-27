class ArtworksController < ApplicationController
    # GET
    # show all users
    def index
        artworks = Artwork.find(params[:user_id])
        render json: artworks
    end


    # GET
    # show a artworks by their id
    def show
        artworks = Artwork.find(params[:id])
        render json: artworks
    end




    # POST
    # create a new artworks
    def create
        artworks = Artwork.new(user_params)

        if artworks.save
            #render json:artworks
            redirect_to users_url(artworks)
        else
            render artworks.errors.full_messages, status: 422
        end
    end


    

    # PATCH / PUT
    # update a artworks's information
    def update
        artworks = Artwork.find(params[:id])
        if artworks.update(user_params)
            redirect_to user_url(artworks)
        else
            render artworks.errors.full_message, status: 422
        end
    end


    # DELETE
    # deletes a specific artworks
    def destroy
        artworks = Artwork.find_by(id: params[:id])
        if artworks && artworks.destroy
            redirect_to user_url
        else
            render json: {'error': 'Artwork does not exist'}
        end
    end

    private
    def artworks_params #create or change
        params.require(:artworks).permit(:title, :image_url, :artist_id)
    end
end
