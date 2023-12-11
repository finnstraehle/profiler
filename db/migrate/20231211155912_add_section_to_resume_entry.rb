class AddSectionToResumeEntry < ActiveRecord::Migration[7.0]
  def change
    add_column :resume_entries, :section, :integer
  end
end
