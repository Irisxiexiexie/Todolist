class TodolistsController < ApplicationController
	def index 
		@todolist = Todolist.all 
		 if params[:status] == "T" 
		 	@todolist= Todolist.where("status  like?","T") 
		 elsif params[:status] == "F" 
		 	@todolist = Todolist.where("status like ?","F") 
		 end
	end 
	def create 
		@todolist = Todolist.new(todolist_params) 
		if @todolist.save 
			redirect_to root_path
		else
		 render :new 
		end
	end 
	def edit 
		@todolist=Todolist.find(params[:id]) 
	end 
	def update
	 @todolist=Todolist.find(params[:id])
	  if @todolist.update(todolist_params) 
	  	redirect_to root_path 
	  else
	   render :edit
	    end 
	end 
	def destroy 
		@todolist=Todolist.find(params[:id]) 
		@todolist.destroy 
		redirect_to root_path 
	end 
	def change 
		@todolist = Todolist.find(params[:id])
		 if @todolist.status == "T"
		  	@todolist.update_attribute(:status,"F") 
		else 
			@todolist.update_attribute(:status,"T") 
		end
		 redirect_to root_path 
	end


	private 
	def todolist_params
	 params.require(:todolist).permit(:thing,:status)
	  end
end
