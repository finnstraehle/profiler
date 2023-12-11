class Resume < ApplicationRecord
  belongs_to :user
  has_many :resume_entries, dependent: :destroy
end
