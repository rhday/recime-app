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
        erb :'posts/new'
    end 

    #create needs one more route
    post "/posts" do 
        #recieves new params from user input in the create new post form
        post = Post.create(title: params[:title], image_url: params[:image_url], description: params[:description], user_id: current_user.id)
        redirect "/posts/#{post.id}"
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
        erb :'/posts/edit'
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
end