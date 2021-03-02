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
	  @post = Post.new(post_params(:title, :description))
	  #@post.save
	  #redirect_to post_path(@post)
	  #@post = Post.new(params.require(:post).permit(:title, :description))
	  @post.save
	  
	  redirect_to post_path(@post)
	end

	def update
	  @post = Post.find(params[:id])
	  @post.update(post_params(:title))
	  #redirect_to post_path(@post)
	  #@post = Post.new(params.require(:post).permit(:title, :description))
	  #@post.save
	  redirect_to post_path(@post)
	end

	def edit
	  @post = Post.find(params[:id])
	end

	private
	# We pass the permitted fields in as *arg
	# this keeps `post_params` pretty dry whi
	# still allowing slightly different behavi
	# depending on the controller action. Th
	# should come after the other methods
	def post_params(*args)
		params.require(:post).permit(*args)
	end 
end
