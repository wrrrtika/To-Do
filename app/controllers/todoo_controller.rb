class TodooController < ApplicationController
	def index
		@todos = Todoo.where(done: false)
		@todone = Todoo.where(done: true)
	end

	def new
		@todo = Todoo.new
	end

	def todo_params
		params.require(:todoo).permit(:name, :description, :done)
	end

	def create
		@todo = Todoo.new(todo_params)

		if @todo.save
			redirect_to todoo_index_path, :notice => "Your item was created"
		else
			redirect_to todoo_index_path, :notice => "please try again"
		end
	end





end
