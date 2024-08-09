class DragonRacesController < ApplicationController
  before_action :set_dragon_race, only: %i[show edit update destroy]

  def index
    @dragon_races = DragonRace.all
  end

  def show
    @placements = @dragon_race.placements
  end

  def new
    @dragon_race = DragonRace.new
  end

  def create
    @dragon_race = DragonRace.new(dragon_race_params)
    if @dragon_race.save
      redirect_to @dragon_race, notice: 'Race was successfully created.'
    else
      render :new
    end
  end

  def edit
    @dragon_race = DragonRace.find(params[:id])
  end

  def update
    if @dragon_race.update(dragon_race_params)
      redirect_to @dragon_race, notice: 'Race was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @dragon_race = DragonRace.find(params[:id])
    @dragon_race.destroy
    redirect_to dragon_races_path, notice: 'Dragon race was successfully deleted.'
  end

  private

  def set_dragon_race
    @dragon_race = DragonRace.find(params[:id])
  end

  def dragon_race_params
    params.require(:dragon_race).permit(:name, :date)
  end
end
