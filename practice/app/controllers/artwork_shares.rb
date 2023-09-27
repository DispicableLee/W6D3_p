class ArtworkShares < ApplicationController

    def index
        artwork_shares = ArtworkShares.all
        render json: artwork_shares
    end

    def create
        artwork_shares = ArtworkShares.new(artwork_shares_params_params)

        if artwork_shares.save
            #render json:artwork_shares
            redirect_to artwork_shares_url(artwork_shares)
        else
            render artwork_shares.errors.full_messages, status: 422
        end
    end

    def destroy
        artwork_shares = ArtworkShares.find_by(id: params[:id])
        if artwork_shares && artwork_shares.destroy
            redirect_to artwork_shares_url
        else
            render json: {'error': 'ArtworkShares does not exist'}
        end
    end

    private
    def artwork_shares_params #create or change
        params.require(:artwork_shares).permit(:artwork_id, :viewer_id)
    end

end