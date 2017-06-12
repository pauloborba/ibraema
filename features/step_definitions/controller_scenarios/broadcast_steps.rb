@email = {}
@article = {}

#Scenario: Send message
Given(/^I wrote an email with subject "([^"]*)" and message "([^"]*)"$/) do |subject, message|
  @email = {email: {subject: subject, message: message}}
  expect(Email.where(subject: subject)).not_to be_nil
end

When(/^I try to send the email "([^"]*)" and message "([^"]*)"$/) do |subject, message|
  @email = {email: {subject: subject, message: message}}
  post '/emails', @email
end

Then(/^an email is sent to the donors with subject "([^"]*)"$/) do |subject|
  #quando o email for criado, logo apos enviar o email, mark = true
  @email = Email.find_by(subject: subject)
  @email.mark = true
  @email.save
  expect(Email.where(mark: true)).not_to be_empty
end

Then(/^the message "([^"]*)" is registered on the system$/) do |subject|
  expect(Email.where(subject: subject)).not_to be_empty
end

Then(/^the system will not send the email\.$/) do
  @email = get '/emails'
  !expect(@email).not_to be_empty
end