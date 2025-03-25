class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
    def index
        @categories = Category.all
    end
    def new
        @categories = Category.new
    end
    def create
        @categories= Category.new(category_params)
    
        if @categories.save
          # Redirect to the categories index or show page upon success
          flash[:notice] = "Category was successfully created."
          redirect_to categories_path, notice: 'Category was successfully created.'
        else
          # Render the 'new' template again if there were validation errors
          render :new
          flash[:notice] = "Category could not be created. Please check your input."
        end
    end
    def show
      @categories = Category.find(params[:id])
    end
    def edit
      # @category is set by the before_action
    end
  
    def update
      if @categories.update(category_params)
        redirect_to categories_path, notice: 'Category was successfully updated.'
      else
        render :edit
      end
    end
    def destroy
      if @categories.destroy
        flash[:notice] = 'Category was successfully deleted.'
      else
        flash[:alert] = 'Error deleting category.'
      end
      redirect_to categories_url
    end
    
 private
 
 def set_category
  @categories = Category.find(params[:id])
end
    
      # Strong parameters to whitelist category attributes
    def category_params
        params.require(:category).permit(:name)  # assuming 'name' is the only attribute
    end
end
