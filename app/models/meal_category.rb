class MealCategory < ApplicationRecord
    has_many :meals, dependent: :destroy
    validates_presence_of :name 
end
