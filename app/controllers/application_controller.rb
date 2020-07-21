require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    #enables session hash
    enable :sessions
    #set a session secret for xtra security
    set :session_secret, "secret_session"
  end

  get "/" do
    erb :welcome
  end

  helpers do 

    #keeps track of logged in user
    def current_user
      User.find_by(id: session[:user_id])
    end 

    def logged_in?
      !!current_user 
    end

  end 

end
