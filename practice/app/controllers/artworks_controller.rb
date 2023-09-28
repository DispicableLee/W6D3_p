class ArtworksController < ApplicationController
    # GET
    # show all users
    def index
        if params.has_key?(:user_id)
            artworks = Artwork.where(artist_id: params[:user_id])
        else
            artworks = Artwork.all
        end
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
        artwork = Artwork.new(artwork_params)

        if artwork.save
            #render json:artworks
            redirect_to artwork_url(artwork)
        else
            render artwork.errors.full_messages, status: 422
        end
    end


    

    # PATCH / PUT
    # update a artworks's information
    def update
        artwork = Artwork.find(params[:id])
        if artwork.update(artwork_params)
            redirect_to artwork_url(artworks)
        else
            render artworks.errors.full_message, status: 422
        end
    end


    # DELETE
    # deletes a specific artworks
    def destroy
        artwork = Artwork.find_by(id: params[:id])
        if artwork && artwork.destroy
            redirect_to artwork_url
        else
            render json: {'error': 'Artwork does not exist'}
        end
    end

    private
    def artwork_params #create or change
        params.require(:artworks).permit(:title, :image_url, :artist_id)
    end
end
