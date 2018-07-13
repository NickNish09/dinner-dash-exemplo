class Order < ApplicationRecord
    belongs_to :situation
    belongs_to :user
    has_many :order_meals
    has_many :meals, through: :order_meals
end
