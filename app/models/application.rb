class Application < ApplicationRecord
  belongs_to :user
  belongs_to :cover_letter, optional: true
  belongs_to :resume, optional: true
  STATUS = ['Interested', 'Applied', 'Interview', 'Offer', 'Pending', 'Accepted', 'Rejected']
end
