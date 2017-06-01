require 'rails_helper'

RSpec.describe "coaching_activities/new", type: :view do
  before(:each) do
    assign(:coaching_activity, CoachingActivity.new(
      :start_date => "MyString",
      :date => "MyString",
      :finish_date => "MyString",
      :date => "MyString"
    ))
  end

  it "renders new coaching_activity form" do
    render

    assert_select "form[action=?][method=?]", coaching_activities_path, "post" do

      assert_select "input#coaching_activity_start_date[name=?]", "coaching_activity[start_date]"

      assert_select "input#coaching_activity_date[name=?]", "coaching_activity[date]"

      assert_select "input#coaching_activity_finish_date[name=?]", "coaching_activity[finish_date]"

      assert_select "input#coaching_activity_date[name=?]", "coaching_activity[date]"
    end
  end
end
