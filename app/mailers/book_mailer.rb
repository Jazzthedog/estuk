class BookMailer < ActionMailer::Base
  def book_created(user)
    mail(to: user.email,
       from: "estuk@estuk.com",
       subject: "New Book Created",
       body: "You just created a book on eStuk!"
    )
  end
end