class HikesController < ApplicationController

    get '/hikes' do 
        redirect_if 
        erb :'hikes/show_hikes'  
    end

    get '/hikes/new' do
        redirect_if
        erb :'hikes/new' 
    end

 

    post '/hikes/new' do 
        redirect_if
        if params[:name] != "" && params[:rating] != "" && params[:difficulty] != "" 
            current_user.hikes << Hike.new(params)
       
            redirect to '/myhikes'
        else
            redirect to '/hikes/new'
        end
    end

    get '/hikes/:id' do
        redirect_if 
        @hike = Hike.find_by(id: params[:id])
        erb :'hikes/show_hike' 
    end

    get '/myhikes' do
        redirect_if
        user = User.find_by(id: session[:user_id])
        @hikes = user.hikes 
        erb :'hikes/show_myhikes'
    end

end
