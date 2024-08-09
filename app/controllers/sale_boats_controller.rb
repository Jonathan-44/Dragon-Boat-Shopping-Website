class SaleBoatsController < ApplicationController
  def index
    @q = Boat.ransack(params[:q])
    @boats = @q.result.where(is_on_sale: true)
  end
end