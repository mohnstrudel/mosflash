class BlogpostsController < ApplicationController
	def index
		@blogposts = Blogpost.all
	end

	def show
		@blogpost = Blogpost.find(params[:id])
		@splittedSentences = @blogpost.body.split('.')
	end
end
