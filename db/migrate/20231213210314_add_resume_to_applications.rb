class AddResumeToApplications < ActiveRecord::Migration[7.0]
  def change
    add_reference :applications, :resume, foreign_key: true
  end
end
