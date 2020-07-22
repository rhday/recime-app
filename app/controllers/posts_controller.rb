class PostsController < ApplicationController
    #CRUD time

    #read - the index for all posts
    get '/posts' do
        #we want to render all posts from the database
        @posts = Post.all
        #use instance variable so view can use it
        erb :'posts/index'
    end
    
end