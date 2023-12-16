class AddBulletTwoToResumeEntry < ActiveRecord::Migration[7.0]
  def change
    add_column :resume_entries, :bullet_two, :text
  end
end
