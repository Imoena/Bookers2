class BooksController < ApplicationController

  def new
  	 @book = Book.new
  end

  def create
    @books = Book.all
  	@book = Book.new(book_params)
    @user = current_user
    @users = User.all
  	@book.user_id = current_user.id
    if @book.save
    flash[:notice] = "You have creatad book successfully."
    redirect_to book_path(@book.id)
    else
    render :index
    end
  end

  def index
  	@books = Book.all
  	@user = current_user
  	@book = Book.new
    @users = User.all
  end

  def show
  	 @book = Book.new
     @books = Book.find(params[:id])
  	 # @user = current_user
     @users = User.all
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
            render "edit"
          else
            redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
	  @book = Book.find(params[:id])
	  @book.destroy
	  redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end