require 'rails_helper'

RSpec.describe "institutions/new", type: :view do
  before(:each) do
    assign(:institution, Institution.new(
      :nome => "MyString",
      : => "MyString",
      :cnpj => "MyString",
      : => "MyString"
    ))
  end

  it "renders new institution form" do
    render

    assert_select "form[action=?][method=?]", institutions_path, "post" do

      assert_select "input#institution_nome[name=?]", "institution[nome]"

      assert_select "input#institution_[name=?]", "institution[]"

      assert_select "input#institution_cnpj[name=?]", "institution[cnpj]"

      assert_select "input#institution_[name=?]", "institution[]"
    end
  end
end
