class OrderMealsController < ApplicationController
    before_action :set_order_meal, only: [:destroy, :show, :edit, :update]
    before_action :authenticate_user!
    
    def index
        @order_meals = OrderMeal.all
    end

    def new
        @order_meal = OrderMeal.new
    end

    def make
        @order = params[:order_id]
        session[:cart].each  do |f|
            create(@order,f["product"],f["quantity"])
        end
        while session[:cart] != [] do
            current_cart.pop()
        end
        redirect_to order_meals_path
    end

    def create(order,product,quantity)
        @order_meal= OrderMeal.new(order_id: order, meal_id: product, quantity: quantity)
        if @order_meal.save
        end  
    end

    def destroy
        order_meal.destroy
        redirect_to order_meals_path
    end

    def edit
    end

    def update
        if order_meal.update(meal_params)
            redirect_to order_meals_path
        else
            render :edit
        end
    end

    def show
        
    end

    private

    def set_order_meal
        order_meal = OrderMeal.find(params[:id])
    end

       
    def current_cart
        session[:cart] ||= []
    end

end
