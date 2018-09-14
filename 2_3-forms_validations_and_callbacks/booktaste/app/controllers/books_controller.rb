class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find params[:id]
  end

  def edit
    @book = Book.find params[:id]
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def update
    @book = Book.find params[:id]
    if @book.update book_params
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    Book.find(params[:id]).destroy
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :preview, :description, :publisher, :year)
  end
end
