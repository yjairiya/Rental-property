class Post < ApplicationRecord
  # has_one_attached :image, dependent: :destroy
  has_one_attached :image

  belongs_to :user
end
