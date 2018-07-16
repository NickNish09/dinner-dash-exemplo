class OrdersController < ApplicationController
    before_action :set_order, only: [:destroy, :show, :show2, :edit, :update]
    before_action :authenticate_user!
    
    def index
        @orders = Order.all
    end

    def new
        @order = Order.new
    end

    def create
        @order= Order.new(order_params)
        if @order.save
            redirect_to order_meals_path
        else
            render :new
        end
    end

    def destroy

        @order.destroy
        if session[:dest] == true
            session[:dest] = false
            redirect_to orders_path
        else
            redirect_to root_path

        end
    end

    def edit
    end

    def update
        if @order.update(order_params)
            redirect_to orders_path
        else
            render :edit
        end
    end

    def show
    end

    private

    def set_order
        @order = Order.find(params[:id])
    end

    def order_params
        params.permit(:price,:user_id,:situation_id)
    end
end
