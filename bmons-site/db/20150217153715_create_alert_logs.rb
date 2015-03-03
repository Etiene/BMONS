class CreateAlertLogs < ActiveRecord::Migration
  def change
    create_table :alert_logs do |t|
      t.text :message
      t.integer :status
      t.string :recipient
      t.datetime :datetime
      t.references :alert, index: true

      t.timestamps null: false
    end
    add_foreign_key :alert_logs, :alerts
  end
end
