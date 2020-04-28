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
        #render show individual hike page 
    end

    get '/myhikes' do
        "here's your hikes"
        #show hikes created by user 
    end

end
