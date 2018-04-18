class LikesController < ApplicationController
    before_action :authorize
    def create
        Like.create(cat_id: params[:cat_id], user: current_user) unless Like.exists?(cat_id: params[:cat_id], user: current_user)
        redirect_to cat_path(params[:cat_id])
    end
end