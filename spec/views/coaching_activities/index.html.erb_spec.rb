require 'rails_helper'

RSpec.describe "coaching_activities/index", type: :view do
  before(:each) do
    assign(:coaching_activities, [
      CoachingActivity.create!(
        :institution => nil
      ),
      CoachingActivity.create!(
        :institution => nil
      )
    ])
  end

  it "renders a list of coaching_activities" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
