class Resume < ApplicationRecord
  belongs_to :user
  has_many :resume_entries, dependent: :destroy
  has_many :applications
end
