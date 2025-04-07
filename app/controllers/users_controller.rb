class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
    def index
        @users= User.all
    end
        def new
          @user = User.new  # Initialize a new User object for the form
        end
       
  def edit
    # @user is set by the before_action
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Profile updated successfully.'
    else
      render :edit
    end
  end
      
        def create
          @user = User.new(user_params)  # Create a new user with form data
          if @user.save
            redirect_to users_path, notice: 'User was successfully created.'  # Redirect to the user show page on success
          else
            render :new  # If save fails, render the new form again
          end
        end
        def show
          @user = User.find(params[:id])  # Find the user by ID from the URL
        end
        def destroy
          if @user.destroy
            flash[:notice] = 'User was successfully deleted.'
            redirect_to users_url
          else
            flash[:alert] = 'Error deleting user.'
            redirect_to users_url
          end
        end
        
      
        private
        def set_user
          @user = User.find(params[:id])
        end
        def user_params
          # Only allow these parameters to be submitted through the form
          params.require(:user).permit(:name,:birthday)
        end
      
end
