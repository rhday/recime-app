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
        @post = Post.find_by(params[:id])
        erb :"/posts/show"
    end 
    
end