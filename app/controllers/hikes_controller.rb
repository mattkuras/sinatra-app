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

    get '/hikes/:id/edit' do
        redirect_if 
        @hike = Hike.find_by(id: params[:id])
        erb :'hikes/edit_hike' 
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

    patch '/tweets/:id' do
        if logged_in?
            if params[:content] == ""
              redirect to "/tweets/#{params[:id]}/edit"
            else
              @tweet = Tweet.find_by_id(params[:id])
              if @tweet && @tweet.user == current_user
                if @tweet.update(content: params[:content])
                  redirect to "/tweets/#{@tweet.id}"
                else
                  redirect to "/tweets/#{@tweet.id}/edit"
                end
              else
                redirect to '/tweets'
              end
            end
          else
            redirect to '/login'
        end
    end


    get '/myhikes' do
        redirect_if
        user = User.find_by(id: session[:user_id])
        @hikes = user.hikes 
        erb :'hikes/show_myhikes'
    end

end
