class AddSectionTwoToResume < ActiveRecord::Migration[7.0]
  def change
    add_column :resumes, :section_two, :string
  end
end
