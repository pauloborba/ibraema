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