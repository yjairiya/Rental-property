class Post < ApplicationRecord
  # has_one_attached :image, dependent: :destroy
  has_many_attached :images, dependent: :destroy

  belongs_to :user
end
