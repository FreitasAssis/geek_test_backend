require 'rails_helper'

RSpec.describe Job, type: :model do
  context "There is a valid name of city?" do
    it "Yes. There is." do
      job = Job.new({ city: "city", experience: "experience", technologies: [] })
      expect(job).to be_valid
    end
    it "No. There is not." do
      job = Job.new({ experience: "experience", technologies: [] })
      expect(job).to_not be_valid
    end
  end

  context "There is a valid experience?" do
    it "Yes. There is." do
      job = Job.new({ city: "city", experience: "experience", technologies: [] })
      expect(job).to be_valid
    end
    it "No. There is not." do
      job = Job.new({ city: "city", technologies: [] })
      expect(job).to_not be_valid
    end
  end
end
