class UsersController < ApplicationController

  def index
    @book = Book.new
    @user = current_user
    @users = User.all
  end

  def show
  	@book = Book.new
  	@user = User.find(params[:id])
  	@books = @user.books.page(params[:page]).reverse_order
  end

   def edit
    @user = User.find(params[:id])
    if @user == current_user
            render "edit"
          else
            redirect_to user_path(current_user)
    end
   end

    def update
    	@user = User.find(params[:id])
    	if @user.update(user_params)
        flash[:notice] = "You have updated user successfully."
        redirect_to user_path(@user.id)
      else
      render :edit
    end
  end

  def follows
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end



  private
    def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end