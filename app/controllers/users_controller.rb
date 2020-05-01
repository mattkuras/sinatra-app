class UsersController < ApplicationController 

    #render login page 
    get '/login' do 
        erb :login
    end

    # receiver login form, find user, add user id to session
    post '/login' do
        @user = User.find_by(username: params[:username])
     if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id 
            redirect to "/hikes"
        else
            redirect to '/login'
        end
    end


    get '/users/:username' do
        redirect_if
        @user = User.find_by(username: params[:username])
        @hikes = @user.hikes 
        erb :'hikes/show_user_hikes'
    end

    #render signup page 
    get '/signup' do 
        erb :signup
    end

    post '/users' do
        if params[:email] == "" || params[:password] == "" || params[:username] == ""
            redirect to '/signup'
        else
        user = User.create(params) 
        user.save 
        session[:user_id] = user.id 
        redirect to "/hikes"
        end
    end

end