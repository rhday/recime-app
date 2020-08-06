class PostsController < ApplicationController
    #CRUD time

    #read - the index for all posts
    get '/posts' do
        #we want to render all posts from the database
        @posts = Post.all
        #use instance variable so view can use it
        erb :'posts/index'
    end

    #create - render form to create new post
    get '/posts/new' do
        if logged_in?
            erb :'posts/new'
        else 
            #show error an dredirect
            flash[:error] = "You must be logged in to create a post!"
            redirect "/"
        end
    end 

    #create needs one more route
    post "/posts" do 
        #recieves new params from user input in the create new post form
        post = Post.create(title: params[:title], image_url: params[:image_url], description: params[:description], user_id: current_user.id)
        if post.save
            #if the input is valid - .save triggers our validation
        #if params[:title] != "" && params[:image_url] != "" && params[:description] != ""
            #show post creation success message
            flash[:message] = "New post created successfully!"
            #redirect to post show page
            redirect "/posts/#{post.id}"
        else 
            #show post creation error message
            flash[:error] = "Failed to create post. Please fill out all fields: #{post.errors.full_messages.to_sentence}"
            redirect "/posts/new"
        end 
    end 

    #this route needs to be underneath the "new" route although you build it first
    # show route for single post
    get '/posts/:id' do 
        #find the post
        @post = Post.find(params[:id])
        #binding.pry
        erb :"/posts/show"
    end 
    
    #update
    #create link to edit foorm on post show page
    #get route for the edit form
    get '/posts/:id/edit' do 
        @post = Post.find(params[:id])
        if authorized_to_edit(@post)
            erb :'/posts/edit'
        else
            #show error message
            flash[:error] = "You are not authorized to edit that post!"
            redirect "/posts"
        end
    end 

    #remember `use Rack::MethodOverride` in config.ru
    #this patch will send our params to and update a new post (or resource)
    patch '/posts/:id' do 
        @post = Post.find(params[:id])
        @post.update(title: params[:title], image_url: params[:image_url], description: params[:description])
        redirect "/posts/#{@post.id}"
    end 

    #delete function to complete CRUD
    #create link for delete on posts show page
    #`use Rack::MethodOverride` in config.ru
    #delete route to delete our selected post
    delete '/posts/:id' do 
        #start by finding the post you want to delete
        @post = Post.find(params[:id])
        #delete it
        @post.destroy
        #redirect to the posts page
        redirect '/posts'
    end 

    post '/posts/:id/like' do 
        @post = Post.find(params[:id])
        #creating the relationship between User, Post and Like by creating a new like
        @like = Like.create(user: current_user, post: @post)
        render '/posts/show' 
    end 

    delete '/posts/:id/unlike' do 
        #find the correct post
        @post = Post.find(params[:id])
        #find and grab the specific instance of a like in question to delete it
        @like = Like.find_by(user: current_user, post: @post)
        #destroy the instance of the like
        @like.destroy 
        render 'posts/show'
    end 

end