require 'rails_helper'

RSpec.describe "coaching_activities/show", type: :view do
  before(:each) do
    @coaching_activity = assign(:coaching_activity, CoachingActivity.create!(
      :institution => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
  end
end
