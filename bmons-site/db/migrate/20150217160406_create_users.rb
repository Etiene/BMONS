class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :access_level
      t.string :login
      t.string :password
      t.string :email
      t.string :tel

      t.timestamps null: false
    end
  end
end
