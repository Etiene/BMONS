class RemoveValueFromMeasurements < ActiveRecord::Migration
  def change
    remove_column :measurements, :value, :integer
  end
end
