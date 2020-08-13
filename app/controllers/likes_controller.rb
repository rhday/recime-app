class LikesController < ApplicationController
    

    def create
        @post.likes.create(user_id: current_user.id)
        redirect_to post_path(@post)
    end 

    private

    def find_post 
        @post = Post.find(params[:post_id])
    end

    def already_liked?
        Like.where(user_id: current_user.id, post_id:
        params[:post_id]).exists?
    end 

    def destroy
        if !(already_liked?)
          flash[:error] = "Cannot unlike"
        else
          @like.destroy
        end
        redirect_to post_path(@post)
    end
    
end
