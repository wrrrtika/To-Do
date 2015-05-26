class TodooController < ApplicationController
	def index
		@todos = Todoo.where(done: false)
		@todone = Todoo.where(done: true)
	end

	def new
		@todo = Todoo.new
	end

	def todo_params
		params.require(:todoo).permit(:name, :done)
	end

	def create
		@todo = Todoo.new(todo_params)

		if @todo.save
			redirect_to todoo_index_path, :notice => "Your item was created"
		else
			render "new"
		end
	end

	def update
		@todo = Todoo.find(params[:id])

		if @todo.update_attribute(:done, true)
			redirect_to todoo_index_path, :notice => "your item has been done"
		else
			redirect_to todoo_index_path, :notice => "unable to edit item"
		end
	end

	def destroy
		@todo = Todoo.find(params[:id])
		@todo.destroy

		redirect_to todoo_index_path, :notice => "item destroyed"
	end





end
