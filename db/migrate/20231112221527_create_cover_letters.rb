class CreateCoverLetters < ActiveRecord::Migration[7.0]
  def change
    create_table :cover_letters do |t|
      t.references :user, null: false, foreign_key: true
      t.string :company
      t.boolean :is_saved
      t.string :name

      t.timestamps
    end
  end
end
