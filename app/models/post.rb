class Post < ApplicationRecord
  # has_one_attached :image, dependent: :destroy
  has_many_attached :images
  belongs_to :user

  enum status: [:pending, :approved, :rejected ]
  
  validates :location, presence: true
  validates :size, presence: true
  validates :price, presence: true
  validates :phone, presence: true
  validates :owner_name, presence: true

end
