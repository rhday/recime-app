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
        redirect "/users/#{user.id}"
       else
        #show error
        redirect '/login'
       end 
    end 

    #users show route
    get '/users/:id' do 
        #find user
        @user = User.find_by(id: params[:id])
        erb :'/users/show'
    end 

    #sign up route
    get '/signup' do
        # render sign up form
        erb :'/users/signup'
    end 

    



end