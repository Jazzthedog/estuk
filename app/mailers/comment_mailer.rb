class CommentMailer < ActionMailer::Base
  def comment_created(current_user,book_user,content)

    @current_user = current_user
    @book_user = book_user
    @content = content

    mail(to: book_user.email,
       from: @current_user.email,
       subject: "Comment Created",
    )
  end
end