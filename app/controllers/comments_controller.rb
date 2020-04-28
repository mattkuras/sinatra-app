class CommentsController < ApplicationController

    get '/comments/new' do
        redirect_if 
        erb :'comments/new' 
    end

end