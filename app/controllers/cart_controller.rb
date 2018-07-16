class CartController < ApplicationController
    
    def add_item
        quantity = params[:quantity]
        @product = params[:id]
        
        current_cart.push({product: @product,quantity: quantity})
   
        redirect_to root_path
    end
 
 
     def remove_item
        @del_product = params[:id]
        current_cart.delete(@del_product)
        redirect_to root_path
    end

    private
        def current_cart
            session[:cart] ||= []
        end

end
