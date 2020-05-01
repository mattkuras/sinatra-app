require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'

    enable :sessions
    set :session_secret, 'password_security'
  end

  get "/" do
    if logged_in? 
      redirect to '/hikes'
    else
      redirect to '/login'
    end
  end

  helpers do

    def redirect_if
      if !logged_in?
        redirect to '/login'
      end
    end

    def logged_in?
      !!current_user
    end

    def current_user 
      @current_user ||= User.find_by(id: session[:user_id])
    end

  end

end
