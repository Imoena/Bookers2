class PostCommentsController < ApplicationController
	
	def create
		@books = Book.find(params[:book_id])
	    @comment = current_user.post_comments.new(post_comment_params)
	    @comment.book_id = @books.id
	    if @comment.save
	    redirect_to book_path(@books)
	    else
	     @book = Book.new
	     # @books = Book.find(params[:id])
	     @users = User.all
	     @post_comment = PostComment.new
	     render :'books/show'
	    end
	end

	def destroy
		 PostComment.find_by(id: params[:id],book_id: params[:book_id]).destroy
         redirect_to book_path(params[:book_id])
	end
	
	private
      def post_comment_params
      params.require(:post_comment).permit(:comment)
    end
end

