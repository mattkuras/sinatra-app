class UsersController < ApplicationController 

    #render login page 
    get '/login' do 
        erb :login
    end

    # receiver login form, find user, add user id to session
    post '/login' do 

    end

    #render signup page 
    get '/signup' do 
    end

end