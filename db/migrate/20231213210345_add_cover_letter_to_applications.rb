class AddCoverLetterToApplications < ActiveRecord::Migration[7.0]
  def change
    add_reference :applications, :cover_letter, null: true, foreign_key: true
  end
end
