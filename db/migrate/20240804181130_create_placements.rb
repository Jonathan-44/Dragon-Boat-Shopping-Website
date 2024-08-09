class CreatePlacements < ActiveRecord::Migration[7.0]
  def change
    create_table :placements do |t|
      t.string :race_name
      t.date :date
      t.string :participant
      t.integer :position

      t.timestamps
    end
  end
end
