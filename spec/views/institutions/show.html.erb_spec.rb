require 'rails_helper'

RSpec.describe "institutions/show", type: :view do
  before(:each) do
    @institution = assign(:institution, Institution.create!(
      :nome => "Nome",
      : => "",
      :cnpj => "Cnpj",
      : => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Cnpj/)
    expect(rendered).to match(//)
  end
end
