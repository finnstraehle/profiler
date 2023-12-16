class RemoveIsActiveFromResumeEntry < ActiveRecord::Migration[7.0]
  def change
    remove_column :resume_entries, :is_active, :boolean
  end
end
