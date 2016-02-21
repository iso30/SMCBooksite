class SearchesController < ApplicationController

	def show
		@search_param = params[:search_params]
		@results = Post.search_posts(params[:search_params])
	end
end
