class CartController < ApplicationController
  before_action :authenticate_shopper!

  def index
    @cart = current_shopper.cart
  end

  def add_boat
    @cart = current_shopper.cart
    @boat = Boat.find(params[:boat_id])

    if @cart.boats.include?(@boat)
      flash.now[:error] = 'Boat is already in the cart.'
      redirect_back(fallback_location: root_path)
    else
      @cart.boats << @boat
      flash[:success] = 'Boat added to cart.'
      redirect_to cart_path
    end
  end

  def remove_boat
    @cart = current_shopper.cart
    @boat = Boat.find(params[:boat_id])

    if @cart.boats.include?(@boat)
      @cart.boats.delete(@boat)
      flash[:success] = 'Boat removed from cart.'
    else
      flash.now[:error] = 'Boat not found in the cart.'
    end

    redirect_to cart_path
  end
end
