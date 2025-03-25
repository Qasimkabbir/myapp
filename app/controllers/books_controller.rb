class BooksController < ApplicationController

    before_action :set_book, only: [:show, :edit, :update, :destroy]

    def index
        @books= Book.all
    end
    def new
        @book = Book.new  # Create a new book object for the form
    end
    def show
      @book = Book.find(params[:id])
    end
    
      # POST /books
    def create
        @book = Book.new(book_params)  # Create a new book with the form data
        if @book.save
          redirect_to new_book_path, notice: 'Book was successfully created.'  # Redirect to the book show page
        else
          render :new  # If saving fails, re-render the new form
        end
    end
     # Set the book before actions like edit, show, update, and destroy

  # GET /books/:id/edit
  def edit
    # @book is already set by the before_action :set_book
  end

  # PATCH/PUT /books/:id
  def update
    if @book.update(book_params)
      redirect_to @book, notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end
  def destroy
    
    if @book.destroy
      flash[:notice] = 'book was successfully deleted.'
    else
      flash[:alert] = 'There was an error deleting the book.'
    end
    redirect_to books_path
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end
    
    def book_params
        params.require(:book).permit(:title)
    end
end
