require 'rails_helper'

RSpec.describe "institutions/new", type: :view do
  before(:each) do
    assign(:institution, Institution.new(
      :name => "MyString",
      :cnpj => "MyString"
    ))
  end

  it "renders new institution form" do
    render

    assert_select "form[action=?][method=?]", institutions_path, "post" do

      assert_select "input#institution_name[name=?]", "institution[name]"

      assert_select "input#institution_cnpj[name=?]", "institution[cnpj]"
    end
  end
end
