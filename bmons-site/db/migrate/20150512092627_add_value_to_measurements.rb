class AddValueToMeasurements < ActiveRecord::Migration
  def change
    add_column :measurements, :value, :float
  end
end
