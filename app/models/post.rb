class Post < ApplicationRecord
  has_many_attached :images
  belongs_to :user

  enum status: [:pending, :approved, :rejected ]
      
  validates :property_status, presence: true
  validates :owner_name, presence: true
  validates :location, presence: true
  validates :size, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :phone, presence: true
  validates :email, presence: true
end
