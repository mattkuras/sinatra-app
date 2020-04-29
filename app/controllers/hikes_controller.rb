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
       
            redirect to '/hikes'
        else
            redirect to '/hikes/new'
        end
    end

    get '/hikes/:id' do
        redirect_if 
        @hike = Hike.find_by(id: params[:id])
        erb :'hikes/show_hike' 
    end

    get '/hikes/:id/edit' do
        redirect_if 
        @hike = Hike.find_by(id: params[:id])
        if @hike.user == current_user
        erb :'hikes/edit_hike' 
        else
            redirect to "/hikes/#{@hike.id}"
        end
    end

    patch '/hikes/:id' do
        redirect_if
        if params[:name] == "" || params[:rating] == "" || params[:difficulty] == "" 
            redirect to "/hikes/#{params[:id]}/edit"
        else
            @hike = Hike.find_by(id: params[:id]) 
            if @hike && @hike.user == current_user
                @hike.update(name: params[:name], rating: params[:rating], difficulty: params[:difficulty])
                redirect to "/hikes/#{@hike.id}" 
            else 
                redirect to "/hikes"
            end
        end
    end


    ### ----> this method is broken. 
    
    get '/hikes/:username' do
        redirect_if
        user = User.find_by(id: params[:username])
        @hikes = user.hikes 
        erb :'hikes/show_user_hikes'
    end

    delete '/hikes/:id/delete' do
         redirect_if
         @hike = Hike.find_by(id: params[:id])
         if @hike && @hike.user == current_user
            @hike.delete 
            redirect to '/hikes'
         else 
            redirect to '/hikes'
         end
    end

end
