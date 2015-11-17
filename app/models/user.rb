class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :books
  acts_as_voter

  # Favorite books of user
  has_many :favorite_books # just the relationship aspect
  has_many :favorites, :through => :favorite_books, :source => :book 
  # the actual books a user favorites
end
