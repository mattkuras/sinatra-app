class HikesController < ApplicationController

    get '/hikes' do 
        erb :'hikes/show_hikes'  
    end

end
