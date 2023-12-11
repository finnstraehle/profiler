class AddSectionThreeToResume < ActiveRecord::Migration[7.0]
  def change
    add_column :resumes, :section_three, :string
  end
end
