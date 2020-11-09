class BooksController < ApplicationController
  def first
  end

  def index
    @book = Book.new
    @books = Book.all
    #@book = Book.find(params[:id])
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path, notice: "Book was successfully updated"
    else
      @books = Book.all
      render 'edit'
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path, notice: "Book was successfully destroyed"
  end

  def create
    @book = Book.new(book_params)
    #book.save
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render 'index' #失敗の場合
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
