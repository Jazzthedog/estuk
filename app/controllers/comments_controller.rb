class CommentsController < ApplicationController
  before_action :set_book, only: [:create]

  def create
      #@book = Book.find(params[:book_id])
      #@book = Book.find_by!(slug: params[:slug])
      @comment = @book.comments.create(comments_params)
      CommentMailer.comment_created(current_user,@book.user,@comment.content).deliver
      redirect_to book_path(@book)
  end

  private

    def set_book
      @book = Book.friendly.find(params[:book_id])
    end  

    def comments_params
       params.require(:comment).permit(:content)
    end
end