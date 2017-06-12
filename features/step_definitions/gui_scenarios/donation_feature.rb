# Helper methods
def searchTable(name, identifier, email, options = {})
  row = page.find('tbody').find_all('tr').select{ |rows| rows.find_all('td')[0].text.to_s == name }[0]
  
  if(options[:not]) then
    expect(row).to be nil
  else
    expect(row.find_all('td')[0].text).to eq(name)
    expect(row.find_all('td')[1].text).to eq(identifier)
    expect(row.find_all('td')[2].text).to eq(email)
  end
end
  

# Steps definitions
When(/^I go to the "([^"]*)" page$/) do |page|
  visit '/' + page
end

Then(/^I can see the user with name "([^"]*)", identifier "([^"]*)" and email "([^"]*)"$/) do |name, identifier, email|
  searchTable(name, identifier, email)
end

Then(/^I can not see the user with name "([^"]*)", CPF "([^"]*)" and email "([^"]*)"$/) do |name, cpf, email|
  searchTable(name, cpf, email, :not => true)
end

Then(/^I can not see the user with name "([^"]*)", CNPJ "([^"]*)" and email "([^"]*)"$/) do |name, cnpj, email|
  searchTable(name, cnpj, email, :not => true)
end