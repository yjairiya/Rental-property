class Post < ApplicationRecord
  # has_one_attached :image, dependent: :destroy
  has_many_attached :images
  belongs_to :user

  validates :location, presence: true
  validates :size, presence: true
  validates :price, presence: true
  validates :phone, presence: true
  validates :owner_name, presence: true
  
  enum status: [:pending, :approved, :rejected]

#   def initialize(user)
#     user ||= User.new # guest user (not logged in)
#     if user.admin?
#       can :update, User
#     end
#  end

end
