Given(/^I am at the root page$/) do
  visit '/'
end

Given(/^I am not logged in$/) do
  expect(page).to have_content("You need to sign in or sign up before continuing.")
end

When(/^I select the option "([^"]*)" in select "([^"]*)"$/) do |option, group|
  select(option, :from => group)
end

When(/^I go to the "([^"]*)" page$/) do |page|
  visit '/' + page
end

Then(/^I can see the person with name "([^"]*)", identifier "([^"]*)" and email "([^"]*)"$/) do |name, cpf, email|
  row = page.find('tbody').find_all('tr').select{ |rows| rows.find_all('td')[0].text == name }[0]
  columns = row.find_all('td');

  expect(columns[0].text).to eq(name)
  expect(columns[1].text).to eq(cpf)
  expect(columns[2].text).to eq(email)
end

Then(/^I can not see the person with name "([^"]*)", identifier "([^"]*)" and email "([^"]*)"$/) do |arg1, arg2, arg3|
  row = page.find('tbody').find_all('tr').select{ |rows| rows.find_all('td')[0].text == name }[0]
  
  expect(row).to be nil
end