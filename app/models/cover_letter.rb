class CoverLetter < ApplicationRecord
  belongs_to :user  # belongs to a user
  has_many :cover_letter_entries, dependent: :destroy # has many cover letter entries, so if the cover letter is deleted, the cover letter entries are deleted
  has_many :applications, dependent: :destroy # has many applications, so if the cover letter is deleted, the applications are deleted
end
