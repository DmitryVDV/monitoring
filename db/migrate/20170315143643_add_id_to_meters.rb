class AddIdToMeters < ActiveRecord::Migration[5.0]
  def change
    add_column :meters, :id_device, :integer
  end
end
