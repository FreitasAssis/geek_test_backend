require 'rails_helper'

RSpec.describe "candidates/index", type: :view do
  before(:each) do
    assign(:candidates, [
      Candidate.create!(
        city: "City",
        experience: "MyText"
      ),
      Candidate.create!(
        city: "City",
        experience: "MyText"
      )
    ])
  end

  it "renders a list of candidates" do
    render
    assert_select "tr>td", text: "City".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
