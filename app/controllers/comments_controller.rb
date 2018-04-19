class CommentsController < ApplicationController
    before_action :authorize
    
    def create
        @cat = Cat.find(params[:cat_id])
        @comment = Comment.new(params.require(:comment).permit(:content))
        @comment.cat = @cat 
        @comment.user = current_user
        @comment.save
        redirect_to cat_path(@cat)
        
    end

    def destroy
        @comment = Comment.find(params[:id])
        cat = @comment.cat
        if @comment.user != current_user
            redirect_to cat_path(cat)
        else
            @comment.destroy
            redirect_to cat_path(cat)
        end
    end

    def edit
        @comment = Comment.find(params[:id])
        cat = @comment.cat
        if @comment.user != current_user
            redirect_to cat_path(cat)
        end
    end

    def update
        @comment = Comment.find(params[:id])
        @comment.update_attributes(params.require(:comment).permit(:content))
        redirect_to cat_path(@comment.cat)
    end
end