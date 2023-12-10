class CreateResumeEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :resume_entries do |t|
      t.references :resume, null: false, foreign_key: true
      t.string :title
      t.string :subtitle
      t.string :location
      t.date :start
      t.date :end
      t.boolean :is_active

      t.timestamps
    end
  end
end
