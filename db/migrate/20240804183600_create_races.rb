class CreateRaces < ActiveRecord::Migration[7.0]
  def change
    create_table :races do |t|
      t.string :name
      t.date :date

      t.timestamps
    end
  end
end
