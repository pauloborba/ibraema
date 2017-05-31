Given(/^The user "([^"]*)" with email "([^"]*)" is registered in the system$/) do |name, email|
  user = {user:{name: name, email: email}}
  
  post '/users', user
  
  expect(User.find_by name: name).not_to be nil
end

Given(/^The user "([^"]*)" is not marked as a donor$/) do |name|
  expect(User.find_by(name: name).donation).to be nil
end

When(/^User "([^"]*)" subscribes for a monthly donation of "([^"]*)"$/) do |name, amount|
  user = User.find_by name: name
  
  donation = {donation:{amount: amount, user_id: user.id}}
  
  post '/donations', donation
  
  expect(Donation.find_by user_id: user.id).not_to be nil
end

Then(/^User "([^"]*)" is marked as a donor$/) do |name|
  expect(User.find_by(name: name).donation).not_to be nil
end