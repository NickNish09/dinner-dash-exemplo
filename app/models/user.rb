class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates_presence_of :name 
  has_many :orders
  devise :database_authenticatable, :registerable,
          :rememberable, :trackable, :validatable
end
