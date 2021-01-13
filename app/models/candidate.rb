class Candidate < ApplicationRecord
    validates :city, :experience, presence: true
end
