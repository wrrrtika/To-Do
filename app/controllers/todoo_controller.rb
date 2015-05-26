class TodooController < ApplicationController
	def index
		@todos = Todoo.where(done: false)
		@todone = Todoo.where(done: true)
	end

	
end
