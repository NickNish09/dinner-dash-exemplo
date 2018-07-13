class OrdersController < ApplicationController
    before_action :set_order, only: [:destroy, :show, :edit, :update]
    before_action :authenticate_user!
    before_action do 
        redirect_to new_user_session_path unless current_user && current_user.is_admin?  
    end
    def index
        @orders = Order.all
    end

    def new
        @order = Order.new
    end

    def create
        @order= Order.new(order_params)
        if @order.save
            redirect_to orders_path
        else
            render :new
        end
    end

    def destroy
        @order.destroy
        redirect_to orders_path
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
        params.require(:order).permit(:price)
    end
end
