class BooksController < ApplicationController

  def index
    @book = Book.all
    @book = Book.all.order(created_at: :desc)
    @book2 = Book.new(book_params)
    if @book2.save
      flash[:notice] = "Book was successfully created"
      redirect_to book_path(book.id)
    else
      render :new
    end
  end
  def new
    @book = Book.new
  end
  def create
    @book2 = Book.new(book_params)
    if @book2.save
      flash[:notice] = "Book was successfully created"
      redirect_to book_path(book.id)
    else
      render :show
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
      flash[:noti] = "Books was successfully updated."
      redirect_to book_path(book.id)
    end

  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      flash[:notice3] = "Book was successfully destroy."
      redirect_to '/books'
    end
  end

  private
  def book_params
    params.permit(:title, :body)
  end
end
