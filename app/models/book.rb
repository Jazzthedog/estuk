class Book < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  acts_as_votable
  
  belongs_to :user
  has_many :sales  
  has_many :comments
  has_attached_file :image, styles: { medium: "300x300#", thumb: "100x100>" }
  has_attached_file :resource

  validates_attachment_content_type :image, 
  content_type:  /^image\/(png|gif|jpeg)/,
  message: "Only images allowed"

  validates_attachment_content_type :resource,
  content_type: ['application/pdf'],
  message: "Only pdfs allowed"

  validates :image, attachment_presence: true
  validates :resource, attachment_presence: true  
  validates_numericality_of :price, greater_than: 49, message: "must be atleast 50 cents"

  def self.search(search)
    if search
      where(['name LIKE ? or description LIKE ?', "%#{search}%", "%#{search}%"])
    else
      all
    end
  end

end
