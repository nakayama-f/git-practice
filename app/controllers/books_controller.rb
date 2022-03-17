class BooksController < ApplicationController

  def index
    @book = Book.all
    @book = Book.all.order(created_at: :desc)
    @book2 = Book.new(book_params)
  end
  def new
    @book = Book.new
  end
  def create
    @book2 = Book.new(book_params)
    if @book2.save
      redirect_to book_path(book.id), notice: 'Book was successfully created'
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])

  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      redirect_to book_path(book.id), notice: 'Book was sucessfully updated'

    end

  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private
  def book_params
    params.permit(:title, :body)
  end
end
