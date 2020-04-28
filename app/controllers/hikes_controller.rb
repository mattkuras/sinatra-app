class HikesController < ApplicationController

    get '/hikes' do 
        erb :'hikes/show_hikes'  
    end

    get '/hikes/new' do
        erb :'hikes/new' 
    end

 

    post '/hikes/new' do 
 
        if !logged_in?
            redirect to '/login' 
        else 
        if params[:name] != "" && params[:rating] != "" && params[:difficulty] != "" 
            current_user.hikes << Hike.new(params)
       
            redirect to '/myhikes'
        else
            redirect to '/hikes/new'
        end
        end
    end

    get '/hikes/:id' do
        @hike = Hike.find_by(id: params[:id])
        erb :'hikes/show_hike' 
    end

    get '/myhikes' do
        user = User.find_by(id: session[:user_id])
        @hikes = user.hikes 
        erb :'hikes/show_myhikes'
    end

end
