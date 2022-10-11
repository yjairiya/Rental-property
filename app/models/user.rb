class User < ApplicationRecord
  has_many  :posts
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable , :confirmable
  enum role: [:user, :owner, :admin]
  after_initialize do
    if self.new_record?
      self.role ||= :user
    end
  end
  validates :email, presence: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/
  validates_presence_of :first_name, :last_name, :password, :phone
end 
