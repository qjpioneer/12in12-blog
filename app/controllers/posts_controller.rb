class PostsController < ApplicationController
	def index
		@posts=Post.all.order('created_at DESC')#根據時間排序
	end

	def new
		@post =Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to posts_path
		else
			render 'new' #使用render 不會讓內容消失，redirect_to 會因為他是刷新html
		end
	end


	def show
		@post = Post.find(params[:id])
	end

	def edit
	end

	private
		def post_params
			params.require(:post).permit(:title, :body)
		end

end
