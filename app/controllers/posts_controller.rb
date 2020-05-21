class PostsController < ApplicationController
    def index
        @posts = Post.all 
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.valid?
            @post.save
            redirect_to @post
        else
            flash[:errors] = @post.errors.full_messages
            render :new
        end
    end

    def update
        @post = Post.find(params[:id])
        new_like = @post.likes += 1
        @post.update(likes: new_like)
        redirect_to @post
    end

    private

    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end
end