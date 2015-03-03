class AddModeColumnToBeehives < ActiveRecord::Migration
  def change
    add_column :beehives, :mode, :integer
  end
end
