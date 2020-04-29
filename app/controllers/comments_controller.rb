class CommentsController < ApplicationController

    post '/comments/new' do
        redirect_if 
        if params[:content] == ""
            redirect to '/hikes/:id'
        else
            @comment = Comment.create(params)
            current_user.comments << @comment 
            redirect to "/hikes"
        end
    end

end