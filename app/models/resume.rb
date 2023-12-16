class Resume < ApplicationRecord
  belongs_to :user  # belongs to a user
  has_many :resume_entries, dependent: :destroy # has many resume entries, so if the resume is deleted, the resume entries are deleted
  has_many :applications, dependent: :destroy # has many applications, so if the resume is deleted, the applications are deleted
end
