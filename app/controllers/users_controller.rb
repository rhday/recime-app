class UsersController < ApplicationController

    #make sure you render views here!

    get '/login' do 
        erb :'users/login'
    end 

    post '/login' do 
        #find user
       user = User.find_by(email: params[:email])
       #authenticate user
       if user && user.authenticate(params[:password])
        #create key/value pair in the session hash and uses user_id to log them in
        session[:user_id] = user.id
        # add success message to flash hash
        flash[:message] = "Welcome back #{user.name}!"
        #redirect to user profile(show.erb)
        redirect "/users/#{user.id}"
       else
        #show error
        flash[:error] = "Your input was invalid. Please try again."
        #redirect back to login
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

    #post sign up route
    post '/users' do 

        @user = User.create(params)
        if @user.valid?
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"
        else
            #binding.pry 
            flash[:error] = "Failed to create post. Please fill out all fields: #{@user.errors.full_messages.to_sentence}"
            erb :'/users/signup'

        end
    end 

    #user logout
    get '/logout' do 
        session.clear
        redirect '/'
    end




end