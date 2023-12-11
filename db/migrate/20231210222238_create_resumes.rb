class CreateResumes < ActiveRecord::Migration[7.0]
  def change
    create_table :resumes do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :is_saved
      t.string :name

      t.timestamps
    end
  end
end
