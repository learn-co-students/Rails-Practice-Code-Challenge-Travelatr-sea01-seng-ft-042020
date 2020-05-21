class BloggersController < ApplicationController

    def index
        @bloggers = Blogger.all
    end

    def show
        @blogger = Blogger.find(params[:id])
        @post_with_max_likes = @blogger.max_likes
    end

    def new
        @blogger = Blogger.new
    end

    def create
        @blogger = Blogger.create(blogger_params)
        # byebug
        redirect_to blogger_path(@blogger)
    end

    private

    def blogger_params
        params.require(:blogger).permit(:name, :bio, :age)
    end
end