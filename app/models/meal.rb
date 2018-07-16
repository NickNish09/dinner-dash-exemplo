class Meal < ApplicationRecord
    has_many :order_meals, dependent: :destroy
    has_many :orders, through: :order_meals
    belongs_to :meal_category
    has_one_attached :image
    validates_presence_of :name , :description , :price
    
end
