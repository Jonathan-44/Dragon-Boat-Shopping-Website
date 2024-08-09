class PurchaseBoatsController < ApplicationController
  def index
    @q = Boat.ransack(params[:q])
    @boats = @q.result.available # Only unsold boats
  end
end
