#Scenario: Send message (GUI)
Given(/^I am at the "([^"]*)" page$/) do |page|
   visit '/' + page
end

When(/^I select "([^"]*)"$/) do |button|
   click_on(button)
end

When(/^I fill the field "([^"]*)" with "([^"]*)"$/) do |subject, subject_text|
  fill_in(subject, with: subject_text)
end

When(/^I fill the field "([^"]*)" with the text "([^"]*)"$/) do |message, message_text|
  fill_in(message, with: message_text)
end

Then(/^I can see a successful message$/) do
  expect(page).to have_content("Email was successfully created.")
 
end

Then(/^I can see the message with subject "([^"]*)" in the "([^"]*)" page\.$/) do |subject, page1|
  visit '/' + page1
  expect(page).to have_content(subject)
end

#Scenario: Send message without title (GUI)
When(/^I fill the field "([^"]*)" in blank "([^"]*)"$/) do |subject, subject_text|
  fill_in(subject, with: subject_text)
end
Then(/^I can see an error message about the subject\.$/) do
  expect(page).to have_content("Subject can't be blank")
end

#Scenario: Send message without message (GUI)
Then(/^I can see an error message about the message\.$/) do
  expect(page).to have_content("Message can't be blank")
end