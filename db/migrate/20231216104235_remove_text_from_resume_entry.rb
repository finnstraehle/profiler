class RemoveTextFromResumeEntry < ActiveRecord::Migration[7.0]
  def change
    remove_column :resume_entries, :text, :text
  end
end
