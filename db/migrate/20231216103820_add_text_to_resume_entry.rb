class AddTextToResumeEntry < ActiveRecord::Migration[7.0]
  def change
    add_column :resume_entries, :text, :text
  end
end
