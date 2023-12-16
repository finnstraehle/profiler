class RemoveSectionOneFromResume < ActiveRecord::Migration[7.0]
  def change
    remove_column :resumes, :section_one, :string
  end
end
