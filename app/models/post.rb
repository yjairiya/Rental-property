class Post < ApplicationRecord
  # has_one_attached :image, dependent: :destroy
  validates :location, presence: true
  validates :size, presence: true
  validates :price, presence: true
  validates :phone, presence: true
  validates :owner_name, presence: true
  has_one_attached :image
  belongs_to :user
end
