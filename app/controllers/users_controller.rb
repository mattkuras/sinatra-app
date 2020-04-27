class UsersController < ApplicationController 

    #render login page 
    get '/login' do 
        erb :login
    end

    # receiver login form, find user, add user id to session
    post '/login' do
        @user = User.find_by(username: params[:username])
     #   if @user.authenticate(params[:username])
     if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id 
            redirect to "/users/#{@user.id}"
        else
            redirect to '/login'
        end
    end

    get '/users/:id' do
        "show route"
    end

    #render signup page 
    get '/signup' do 
    end

end