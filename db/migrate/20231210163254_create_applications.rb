class CreateApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :applications do |t|
      t.references :user, null: false, foreign_key: true
      t.string :company
      t.string :status
      t.string :link

      t.timestamps
    end
  end
end
