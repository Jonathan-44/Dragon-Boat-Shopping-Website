class BoatsController < ApplicationController
  before_action :authenticate_vendor!, only: [:index, :restock]
  before_action :set_boat, only: [:show, :edit, :update, :restock]
  before_action :set_vendor

  def update
    if @boat.update(boat_params)
      redirect_to @boat, notice: 'Boat was successfully updated.'
    else
      render :edit
    end
  end

  def index
    @boats = Boat.available.for_vendor(@vendor)
  end

  def new
    @boat = Boat.new
  end

  def create
    @boat = current_vendor.boats.new(boat_params)
    if @boat.save
      redirect_to boats_path, notice: 'New boat added successfully!'
    else
      flash.now[:alert] = @boat.errors.full_messages.join(', ')
      render :new
    end
  end

  def show
    @boat = Boat.find(params[:id])
    @related_boats = Boat.where.not(id: @boat.id).sample(5)
    @reviews = @boat.reviews.includes(:shopper)
  end

  def restock
    if @boat
      @boat.update(sold: false)
      redirect_to sales_reports_path, notice: 'Boat has been restocked.'
    else
      redirect_to sales_reports_path, alert: 'Boat not found.'
    end
  end
  

  private

  def set_boat
    @boat = Boat.find(params[:id])
  end

  def set_vendor
    @vendor = current_vendor
  end

  def boat_params
    params.require(:boat).permit(:name, :description, :price, :features, :image, :is_on_sale, :discount)
  end


end
