class PlacementsController < ApplicationController
  before_action :set_dragon_race
  before_action :set_placement, only: [:show, :edit, :update, :destroy]

  def index
    @placements = @dragon_race.placements
  end

  def show
  end

  def new
    @placement = @dragon_race.placements.build
  end

  def create
    @placement = @dragon_race.placements.build(placement_params)
    if @placement.save
      redirect_to dragon_race_placements_path(@dragon_race), notice: 'Placement was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @placement.update(placement_params)
      redirect_to dragon_race_placements_path(@dragon_race), notice: 'Placement was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @placement.destroy
      redirect_to dragon_race_placements_path(@dragon_race), notice: 'Placement was successfully deleted.'
    else
      redirect_to dragon_race_placements_path(@dragon_race), alert: 'Unable to delete the placement.'
    end
  end

  private

  def set_dragon_race
    @dragon_race = DragonRace.find(params[:dragon_race_id])
  end

  def set_placement
    @placement = @dragon_race.placements.find_by(id: params[:id])
    redirect_to dragon_race_placements_path(@dragon_race), alert: 'Placement not found.' unless @placement
  end

  def placement_params
    params.require(:placement).permit(:participant, :position)
  end
end
