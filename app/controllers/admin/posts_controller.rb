class Admin::PostsController < ApplicationController
	before_action :find_post,only: %i[show edit update destroy]
	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

    def create
		@post = Post.new(post_params)
		if @post.save
		else
		redirect_to admin_post_path(@post)
        end
	end

	def show
	
	end

	def edit
	end

	def update
		if @post = Post.update(post_params)
			redirect_to admin_posts_path(@post)
        else
        redirect_to admin_posts_path
    end
	end

	def destroy
		if @post.destroy
		redirect_to admin_posts_path
	    else
		redirect_to admin_posts_path
	    end
    end

	def find_post
		@post = Post.find(params[:id])
	end

	private
	def post_params
		params.require(:post).permit(:title,:context, :image)
	end
end
