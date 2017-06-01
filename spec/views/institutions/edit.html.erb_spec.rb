require 'rails_helper'

RSpec.describe "institutions/edit", type: :view do
  before(:each) do
    @institution = assign(:institution, Institution.create!(
      :nome => "MyString",
      : => "MyString",
      :cnpj => "MyString",
      : => "MyString"
    ))
  end

  it "renders the edit institution form" do
    render

    assert_select "form[action=?][method=?]", institution_path(@institution), "post" do

      assert_select "input#institution_nome[name=?]", "institution[nome]"

      assert_select "input#institution_[name=?]", "institution[]"

      assert_select "input#institution_cnpj[name=?]", "institution[cnpj]"

      assert_select "input#institution_[name=?]", "institution[]"
    end
  end
end
