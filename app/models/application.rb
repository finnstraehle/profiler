class Application < ApplicationRecord # define the application model
  belongs_to :user  # belongs to a user
  belongs_to :cover_letter, optional: true  # belongs to a cover letter (optional), 
  belongs_to :resume, optional: true  # belongs to a resume (optional)
  STATUS = ['Interested', 'Applied', 'Interview', 'Offer', 'Pending', 'Accepted', 'Rejected'] # define the status options for the application (used in seed and edit/new application)
end
