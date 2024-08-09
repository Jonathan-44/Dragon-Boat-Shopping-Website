class CreateDragonRaces < ActiveRecord::Migration[7.0]
  def change
    create_table :dragon_races do |t|
      t.string :name
      t.date :date

      t.timestamps
    end
  end
end
