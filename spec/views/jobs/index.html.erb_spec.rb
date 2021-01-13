require 'rails_helper'

RSpec.describe "jobs/index", type: :view do
  before(:each) do
    assign(:jobs, [
      Job.create!(
        city: "City",
        experience: "MyText"
      ),
      Job.create!(
        city: "City",
        experience: "MyText"
      )
    ])
  end

  it "renders a list of jobs" do
    render
    assert_select "tr>td", text: "City".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
