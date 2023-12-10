class Application < ApplicationRecord
  belongs_to :user

  STATUS = ['Interested', 'Applied', 'Interview', 'Offer', 'Pending', 'Accepted', 'Rejected']
end
