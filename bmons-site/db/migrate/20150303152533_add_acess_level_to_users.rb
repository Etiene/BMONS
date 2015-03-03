class AddAcessLevelToUsers < ActiveRecord::Migration
  def change
    add_column :users, :access_level, :integer
  end
end
