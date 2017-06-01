require 'rails_helper'

RSpec.describe "coaching_activities/index", type: :view do
  before(:each) do
    assign(:coaching_activities, [
      CoachingActivity.create!(
        :start_date => "Start Date",
        :date => "Date",
        :finish_date => "Finish Date",
        :date => "Date"
      ),
      CoachingActivity.create!(
        :start_date => "Start Date",
        :date => "Date",
        :finish_date => "Finish Date",
        :date => "Date"
      )
    ])
  end

  it "renders a list of coaching_activities" do
    render
    assert_select "tr>td", :text => "Start Date".to_s, :count => 2
    assert_select "tr>td", :text => "Date".to_s, :count => 2
    assert_select "tr>td", :text => "Finish Date".to_s, :count => 2
    assert_select "tr>td", :text => "Date".to_s, :count => 2
  end
end
