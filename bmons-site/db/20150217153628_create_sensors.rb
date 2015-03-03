class CreateSensors < ActiveRecord::Migration
  def change
    create_table :sensors do |t|
      t.string :name
      t.string :type
      t.string :unity
      t.references :beehive, index: true

      t.timestamps null: false
    end
    add_foreign_key :sensors, :beehives
  end
end
