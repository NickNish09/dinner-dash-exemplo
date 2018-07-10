class Order < ApplicationRecord
    has_many :order_meals
    has_many :meals, through: :order_meals
end
