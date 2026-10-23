class CartsController < ApplicationController
  def show
    @cart = CartItem.where(cart_id: current_cart.id)
    @total_price = @cart.sum { |item| item.product.price * item.quantity }
  end
end
