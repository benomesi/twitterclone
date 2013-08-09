class UserController < ApplicationController

#the form to create a new user
def new
	@user = User.new
end

#create user_params
def user_params
	params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
end

#the POST request to submit a new user form
def create
	@user = User.create(user_params)
	if @user.save
		flash[:notice] = "Your account has been created."
	else
		flash[:notice] = "There was an error creating your account."
	end
	redirect_to root_path
end

#to edit a user
def edit
	@user = User.find(params[:id])
end

#the PUT request to update a user's information
def update
	@user = User.find(params[:id])
	if @user.update_attributes(user_params)
		flash[:notice] = "Your account was updated successfully."
	else
		flash[:notice] = "There was a problem updating your account."
	end
	redirect_to user_path(@user)
end

def show
	@user = User.find(params[:id])
end







end
