class RemoveSectionThreeFromResume < ActiveRecord::Migration[7.0]
  def change
    remove_column :resumes, :section_three, :string
  end
end
