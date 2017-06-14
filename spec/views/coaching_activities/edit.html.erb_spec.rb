require 'rails_helper'

RSpec.describe "coaching_activities/edit", type: :view do
  before(:each) do
    @coaching_activity = assign(:coaching_activity, CoachingActivity.create!(
      :institution => nil
    ))
  end

  it "renders the edit coaching_activity form" do
    render

    assert_select "form[action=?][method=?]", coaching_activity_path(@coaching_activity), "post" do

      assert_select "input#coaching_activity_institution_id[name=?]", "coaching_activity[institution_id]"
    end
  end
end
