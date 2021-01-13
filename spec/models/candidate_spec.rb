require 'rails_helper'

RSpec.describe Candidate, type: :model do
  context "There is a valid name of city?" do
    it "Yes. There is." do
      candidate = Candidate.new({ city: "city", experience: "experience", technologies: [] })
      expect(candidate).to be_valid
    end
    it "No. There is not." do
      candidate = Candidate.new({ experience: "experience", technologies: [] })
      expect(candidate).to_not be_valid
    end
  end

  context "There is a valid experience?" do
    it "Yes. There is." do
      candidate = Candidate.new({ city: "city", experience: "experience", technologies: [] })
      expect(candidate).to be_valid
    end
    it "No. There is not." do
      candidate = Candidate.new({ city: "city", technologies: [] })
      expect(candidate).to_not be_valid
    end
  end
end
