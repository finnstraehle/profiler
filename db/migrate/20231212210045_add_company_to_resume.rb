class AddCompanyToResume < ActiveRecord::Migration[7.0]
  def change
    add_column :resumes, :company, :string
  end
end
