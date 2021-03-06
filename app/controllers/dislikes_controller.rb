class DislikesController < ApplicationController
    before_action :authorize
    def create
        if Like.exists?(cat_id: params[:cat_id], user: current_user)
            redirect_to cat_path(params[:cat_id])
        else
            Dislike.create(cat_id: params[:cat_id], user: current_user) unless Dislike.exists?(cat_id: params[:cat_id], user: current_user)
            redirect_to cat_path(params[:cat_id])
        end
    end
end