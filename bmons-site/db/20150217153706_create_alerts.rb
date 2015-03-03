class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.string :type
      t.integer :frequency
      t.text :message
      t.integer :threshold
      t.string :comparison
      t.boolean :active
      t.references :user, index: true
      t.references :sensor, index: true

      t.timestamps null: false
    end
    add_foreign_key :alerts, :users
    add_foreign_key :alerts, :sensors
  end
end
