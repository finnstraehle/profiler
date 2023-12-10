class AddNotesToApplication < ActiveRecord::Migration[7.0]
  def change
    add_column :applications, :notes, :text
  end
end
