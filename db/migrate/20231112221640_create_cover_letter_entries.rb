class CreateCoverLetterEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :cover_letter_entries do |t|
      t.references :cover_letter, null: false, foreign_key: true
      t.text :text

      t.timestamps
    end
  end
end
