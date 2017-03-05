class CreateMeters < ActiveRecord::Migration[5.0]
  def change
    create_table :meters do |t|
      t.float    "meter_value"
      t.datetime "meter_date"
      t.timestamps
    end
  end
end
