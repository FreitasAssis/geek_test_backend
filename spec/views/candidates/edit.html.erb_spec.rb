require 'rails_helper'

RSpec.describe "candidates/edit", type: :view do
  before(:each) do
    @candidate = assign(:candidate, Candidate.create!(
      city: "MyString",
      experience: "MyText"
    ))
  end

  it "renders the edit candidate form" do
    render

    assert_select "form[action=?][method=?]", candidate_path(@candidate), "post" do

      assert_select "input[name=?]", "candidate[city]"

      assert_select "textarea[name=?]", "candidate[experience]"
    end
  end
end
