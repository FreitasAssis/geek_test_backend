class Job < ApplicationRecord
    validates :city, :experience, presence: true
end
