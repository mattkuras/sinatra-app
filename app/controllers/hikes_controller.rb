class HikesController < ApplicationController

    get '/hikes' do 
        erb :'hikes/show_hikes'  
    end

    get '/hikes/:id' do
        #render show individual hike page 
    end

    get '/hikes/new' do
        erb :'hikes/new' 
    end

    post '/hikes/new' do 
        if !logged_in?
            redirect to '/login' 
        if params[:name] && params[:rating] && params[:difficulty] != ""

    end

    get '/hikes/myhikes' do
        #show hikes created by user 
    end

end
