class CatsController < ApplicationController
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
    end

    def update

    end

    def destroy

    end

    private
    def cat_params
        params.require(:cat).permit(:name, :caption, :image)
    end


end