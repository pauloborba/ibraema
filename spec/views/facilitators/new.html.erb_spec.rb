require 'rails_helper'

RSpec.describe "facilitators/new", type: :view do
  before(:each) do
    assign(:facilitator, Facilitator.new(
      :name => "MyString",
      :cpf => "MyString",
      :institution => nil
    ))
  end

  it "renders new facilitator form" do
    render

    assert_select "form[action=?][method=?]", facilitators_path, "post" do

      assert_select "input#facilitator_name[name=?]", "facilitator[name]"

      assert_select "input#facilitator_cpf[name=?]", "facilitator[cpf]"

      assert_select "input#facilitator_institution_id[name=?]", "facilitator[institution_id]"
    end
  end
end
