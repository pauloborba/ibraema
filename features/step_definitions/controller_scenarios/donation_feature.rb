# Helper methods
def getUser(name)
  User.find_by(name: name)
end

# Steps definitions
Given(/^Person with name "([^"]*)", "([^"]*)" and "([^"]*)" is registered in the system$/) do |name, cpf, email|
  user = { user: { name: name, identifier: cpf, email: email, password: 'password', "user[password_confirmation]": 'password '} }

  Capybara.current_session.driver.post '/users', user
  
  expect(getUser(name)).not_to be nil
end

Given(/^Person "([^"]*)" is not marked as a donor$/) do |name|
  expect(getUser(name).isDonor).to be false
end

When(/^A donation of "([^"]*)" reais from person "([^"]*)" is confirmed by payment gateway$/) do |amount, name|
  user = getUser(name)

  donation = { donation: { amount: amount, donation_date: DateTime.now, user_id: user.id } }

  Capybara.current_session.driver.post '/donations', donation
end

Then(/^Person "([^"]*)" is marked as a donor$/) do |name|
  expect(getUser(name).isDonor).to be true
end

Given(/^Company with name "([^"]*)", "([^"]*)" and "([^"]*)" is registered in the system$/) do |name, cnpj, email|
  user = { user: { name: name, identifier: cnpj, email: email, password: 'password', "user[password_confirmation]": 'password '} }

  Capybara.current_session.driver.post '/users', user
  
  expect(getUser(name)).not_to be nil
end

Given(/^Company "([^"]*)" is not marked as a sponsor$/) do |name|
  expect(getUser(name).isSponsor).to be false
end

When(/^A donation of "([^"]*)" reais from company "([^"]*)" is confirmed by payment gateway$/) do |amount, name|
  company = getUser(name)
  
  donation = { donation: { amount: amount, donation_date: DateTime.now, user_id: company.id } }
  
  Capybara.current_session.driver.post '/donations', donation
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