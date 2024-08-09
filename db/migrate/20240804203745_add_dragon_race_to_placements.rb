class AddDragonRaceToPlacements < ActiveRecord::Migration[7.0]
  def change
    add_reference :placements, :dragon_race, null: false, foreign_key: true
  end
end
