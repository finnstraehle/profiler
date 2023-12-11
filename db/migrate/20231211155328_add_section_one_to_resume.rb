class AddSectionOneToResume < ActiveRecord::Migration[7.0]
  def change
    add_column :resumes, :section_one, :string
  end
end
