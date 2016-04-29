class VisitorsController < ApplicationController
	def home
		@search = Search.new
	end
end
