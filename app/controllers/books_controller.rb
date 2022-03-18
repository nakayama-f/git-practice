class BooksController < ApplicationController

  def index
    @books = Book.all.order(created_at: :desc)
    @book2 = Book.new(book_params)
  end
  def show
    @book = Book.find(params[:id])
  end
  def new
    @book = Book.new
  end
  def create
    @book2 = Book.new(book_params)
    if @book2.save
      redirect_to book_path(@book2.id), notice: 'Book was successfully created'
    else
       render @books
    end
  end

  def edit
    @book = Book.find(params[:id])

  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path, notice: 'Book was successfully updated'
    else :index

    end

  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books', notice: 'Book was successfully destroyed'
  end

  private
  def book_params
    params.permit(:title, :body)
  end
end
