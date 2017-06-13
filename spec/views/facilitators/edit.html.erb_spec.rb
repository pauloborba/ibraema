require 'rails_helper'

RSpec.describe "facilitators/edit", type: :view do
  before(:each) do
    @facilitator = assign(:facilitator, Facilitator.create!(
      :name => "MyString",
      :cpf => "MyString",
      :institution => nil,
      :coaching_activity => nil
    ))
  end

  it "renders the edit facilitator form" do
    render

    assert_select "form[action=?][method=?]", facilitator_path(@facilitator), "post" do

      assert_select "input#facilitator_name[name=?]", "facilitator[name]"

      assert_select "input#facilitator_cpf[name=?]", "facilitator[cpf]"

      assert_select "input#facilitator_institution_id[name=?]", "facilitator[institution_id]"

      assert_select "input#facilitator_coaching_activity_id[name=?]", "facilitator[coaching_activity_id]"
    end
  end
end
