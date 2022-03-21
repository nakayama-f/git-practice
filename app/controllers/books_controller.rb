class BooksController < ApplicationController

  def index
    @books = Book.all.order(created_at: :desc)
    @book_new = Book.new

  end
  def show
    @book = Book.find(params[:id])
  end
  def new
    @book = Book.new
  end
  def create
    @books = Book.all.order(created_at: :desc)
    @book_new = Book.new(book_params)
    if @book_new.save
      redirect_to book_path(@book_new.id), notice: 'Book was successfully created'
    else
      render ("books/index")
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: 'Book was successfully updated'
    else
      render ("books/edit")

    end

  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books', notice: 'Book was successfully destroyed'
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
