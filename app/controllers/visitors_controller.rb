class VisitorsController < ApplicationController
	def index
		@search = Search.new
	end
end
