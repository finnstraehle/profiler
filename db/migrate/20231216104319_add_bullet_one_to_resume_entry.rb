class AddBulletOneToResumeEntry < ActiveRecord::Migration[7.0]
  def change
    add_column :resume_entries, :bullet_one, :text
  end
end
