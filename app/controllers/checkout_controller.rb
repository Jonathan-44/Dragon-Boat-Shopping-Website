class CheckoutController < ApplicationController
  before_action :authenticate_shopper!

  def show
    @cart = current_shopper.cart
    @order = Order.new
    @cart_items = @cart.boats if @cart
  end

  def create
    @order = Order.new(order_params)
    @order.shopper = current_shopper
    @order.cart = current_shopper.cart # Assign the cart to the order

    if @order.save
      current_shopper.cart.destroy_all_items # Clear all items from the cart
      redirect_to root_path, notice: 'Order was successfully created.'
    else
      @cart_items = current_shopper.cart.boats # Re-fetch cart items for the form
      render :show
    end
  end

  private

  def order_params
    params.require(:order).permit(:name, :email, :address, :city, :state, :zip, :country, :credit_card_number, :expiration_date, :cvv)
  end
end
