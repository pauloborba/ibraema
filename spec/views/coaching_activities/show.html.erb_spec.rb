require 'rails_helper'

RSpec.describe "coaching_activities/show", type: :view do
  before(:each) do
    @coaching_activity = assign(:coaching_activity, CoachingActivity.create!(
      :start_date => "Start Date",
      :date => "Date",
      :finish_date => "Finish Date",
      :date => "Date"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Start Date/)
    expect(rendered).to match(/Date/)
    expect(rendered).to match(/Finish Date/)
    expect(rendered).to match(/Date/)
  end
end
