class UsersController < ApplicationController

    #make sure you render views here!

    get '/login' do 
        erb :login
    end 

    post '/login' do 
        #find user
       user = User.find_by(email: params[:email])
       #authenticate user
       if user && user.authenticate(params[:password])
        #create key/value pair in the session hash and uses user_id to log them in
        session[:user_id] = user.id
        #redirect to user profile(show.erb)
       else
        #show error
        redirect '/login'
       end 
    end 

end