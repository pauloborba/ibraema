require 'rails_helper'

RSpec.describe "institutions/edit", type: :view do
  before(:each) do
    @institution = assign(:institution, Institution.create!(
      :name => "MyString",
      :cnpj => "MyString",
      :facilitator => ""
    ))
  end

  it "renders the edit institution form" do
    render

    assert_select "form[action=?][method=?]", institution_path(@institution), "post" do

      assert_select "input#institution_name[name=?]", "institution[name]"

      assert_select "input#institution_cnpj[name=?]", "institution[cnpj]"

      assert_select "input#institution_facilitator[name=?]", "institution[facilitator]"
    end
  end
end
