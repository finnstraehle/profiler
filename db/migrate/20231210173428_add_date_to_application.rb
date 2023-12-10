class AddDateToApplication < ActiveRecord::Migration[7.0]
  def change
    add_column :applications, :date, :date
  end
end
