# Helper methods
def getUser(name)
  User.find_by(name: name)
end

# Steps definitions
Given(/^Person with name "([^"]*)", "([^"]*)" and "([^"]*)" is registered in the system$/) do |name, cpf, email|
  person = { user: { name: name, identifier: cpf, email: email } }
  
  post '/users', person
  
  expect(getUser(name)).not_to be nil
end

Given(/^Person "([^"]*)" is not marked as a donor$/) do |name|
  expect(getUser(name).isDonor).to be false
end

When(/^A donation of "([^"]*)" reais from person "([^"]*)" is confirmed by payment gateway$/) do |amount, name|
  user = getUser(name)
  
  donation = { donation: { amount: amount, donation_date: DateTime.now, user_id: user.id } }
  
  post '/donations', donation
end

Then(/^Person "([^"]*)" is marked as a donor$/) do |name|
  expect(getUser(name).isDonor).to be true
end

Given(/^Company with name "([^"]*)", "([^"]*)" and "([^"]*)" is registered in the system$/) do |name, cnpj, email|
  company = { user: { name: name, identifier: cnpj, email: email } }
  
  post '/users', company
  
  expect(getUser(name)).not_to be nil
end

Given(/^Company "([^"]*)" is not marked as a sponsor$/) do |name|
  expect(getUser(name).isSponsor).to be false
end

When(/^A donation of "([^"]*)" reais from company "([^"]*)" is confirmed by payment gateway$/) do |amount, name|
  company = getUser(name)
  
  donation = { donation: { amount: amount, donation_date: DateTime.now, user_id: company.id } }
  
  post '/donations', donation
end

Then(/^Company "([^"]*)" is still not marked as a sponsor$/) do |name|
  expect(getUser(name).isSponsor).to be false
end

Then(/^Company "([^"]*)" is marked as a Bronze sponsor$/) do |name|
  expect(getUser(name).isBronzeSponsor).to be true
end

Then(/^Company "([^"]*)" is marked as a Silver sponsor$/) do |name|
  expect(getUser(name).isSilverSponsor).to be true
end

Then(/^Company "([^"]*)" is marked as a Gold sponsor$/) do |name|
  expect(getUser(name).isGoldSponsor).to be true
end