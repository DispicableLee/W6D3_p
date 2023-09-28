class CommentsController < ApplicationController
    #create
    #destroy
    #index
    def index
        comments = Comment.all
        render json: comments
    end

    def create
        comment = Comment.new(comment_params)
        if comment.save
            redirect_to comment_url(comment)
        else
            render comment.errors.full_messages, status: 422
        end
    end

    def destroy
        comment = Comment.find_by(id: params[:id])
        if comment && comment.destroy
            redirect_to commment_url
        else
            render json: {'error': 'Not found'}
        end
    end

    private
    def comment_params
        params.require(:comments).permit(:artist_id, :author_id, :body)
    end

end
