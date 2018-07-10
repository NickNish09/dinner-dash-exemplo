class Meal < ApplicationRecord
    belongs_to :meal_category
    has_one_attached :image
    validates_presence_of :name , :description , :price
    
end
