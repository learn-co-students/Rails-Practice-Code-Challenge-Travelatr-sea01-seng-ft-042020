class PostsController < ApplicationController

    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.create(post_params)
        if @post.valid?
            redirect_to(post_path(@post))
        else
            render(:new)
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id]).update(post_params)
        if @post.valid?
            redirect_to(post_path(@post))
        else
            render(:new)
        end
    end

    def add_like
        @post = Post.find(params[:id])
        @post.add_like
        redirect_to(post_path(@post))
    end

    private
    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end

end