require 'rails_helper'

RSpec.describe "coaching_activities/new", type: :view do
  before(:each) do
    assign(:coaching_activity, CoachingActivity.new(
      :institution => nil
    ))
  end

  it "renders new coaching_activity form" do
    render

    assert_select "form[action=?][method=?]", coaching_activities_path, "post" do

      assert_select "input#coaching_activity_institution_id[name=?]", "coaching_activity[institution_id]"
    end
  end
end
