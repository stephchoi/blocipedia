class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :collaborators
  has_many :wikis
  has_many :collaborated_wikis, through: :collaborators, source: :wiki
  
  after_initialize { self.role ||= :member }
  enum role: [:member, :premium, :admin]
end
