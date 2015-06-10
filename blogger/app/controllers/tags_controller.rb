class TagsController < ApplicationController
	def index
		@tag = Tag.all.sort_by{|tag| tag.name}
	end

	def show
		@tag = Tag.find(params[:id])
	end

	def destroy
		@tag = Tag.find(params[:id]).destroy

		flash.notice = "Deleted Tag #{@tag.name}!"

		redirect_to tags_path
	end

end
