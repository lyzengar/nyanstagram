class CatsController < ApplicationController
    before_action :authorize, except: [:index, :show]
    def index
        @cats = Cat.all
    end

    def new
        @cat = Cat.new

    end

    def create
        @cat = Cat.new(cat_params)


        if !(current_user.nil?)
            current_user.cats << @cat
            redirect_to cats_path
        else
            render :new
        end
    end

    def edit

    end

    def show
        @cat = Cat.find(params[:id])
        @comment = Comment.new
    end

    def update

    end

    def destroy
        @cat = Cat.find(params[:id])
        if @cat.user != current_user
            redirect_to @cat
        else
            @cat.destroy
            redirect_to root_path
        end
    end

    private
    def cat_params
        params.require(:cat).permit(:name, :caption, :image)
    end


end