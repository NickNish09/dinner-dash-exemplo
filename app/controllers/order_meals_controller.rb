class OrderMealsController < ApplicationController
    before_action :set_order_meal, only: [:destroy, :show, :edit, :update]
    before_action :authenticate_user!
    before_action do 
        redirect_to new_user_session_path unless current_user && current_user.is_admin?  
    end
    def index
        @order_meals = OrderMeal.all
    end

    def new
        @order_meal = OrderMeal.new
    end

    def create
        @order_meal= OrderMeal.new(order_meal_params)
        if order_meal.save
            redirect_to meals_path
        else
            render :new
        end
    end

    def destroy
        order_meal.destroy
        redirect_to meals_path
    end

    def edit
    end

    def update
        if order_meal.update(meal_params)
            redirect_to meals_path
        else
            render :edit
        end
    end

    def show
    end

    private

    def set_meal
        order_meal = OrderMeal.find(params[:id])
    end

    def meal_params
        params.require(:order_meal).permit(:quantity, :meal_id, :order_id)
    end
end
