class RemoveSectionTwoFromResume < ActiveRecord::Migration[7.0]
  def change
    remove_column :resumes, :section_two, :string
  end
end
