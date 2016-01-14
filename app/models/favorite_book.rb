# join model connecting user and books
class FavoriteBook < ActiveRecord::Base
  belongs_to :book
  belongs_to :user  
  validates_uniqueness_of :book_id, scope: :user_id   # prevent duplication of favoriting twice!
end
