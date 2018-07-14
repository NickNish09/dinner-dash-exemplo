class CartController < ApplicationController
    
    def add_item
        quantity = params[:quantity]
        @product = params[:id]
        
        current_cart.push({product: @product,quantity: quantity})
   
        redirect_to root_path
    end
 
 
     def remove_item
        @del_product = params[:id].to_i
        current_cart.pop(@del_product)
        redirect_to root_path
    end

    private
        def current_cart
            session[:cart] ||= []
        end

end