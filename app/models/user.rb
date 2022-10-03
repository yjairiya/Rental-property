class User < ApplicationRecord
  has_many  :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable , :confirmable
  enum role: [:user, :owner, :admin]
  after_initialize do
    if self.new_record?
      self.role ||= :user
    end
  end
  # after_initialize :set_default, if :new_record?
  # def set_default
  #   self.role ||= :user 
  # end
end 
