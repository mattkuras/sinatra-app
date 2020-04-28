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
    #    binding.pry
        erb :'hikes/show_hike' 
    end

    get '/hikes/:id/edit' do
        redirect_if 
        @hike = Hike.find_by(id: params[:id])
       # binding.pry
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


    get '/myhikes' do
        redirect_if
        user = User.find_by(id: session[:user_id])
        @hikes = user.hikes 
        erb :'hikes/show_myhikes'
    end

    delete '/hikes/:id/delete' do
         redirect_if
         @hike = Hike.find_by(id: params[:id])
         if @hike && @hike.user == current_user
            @hike.delete 
         else 
            redirect to '/hikes'
         end
    end

end
