@email = {}
@article = {}

#CONTROLLER SCENARIOS
#Scenario: Send email about notifications
Given(/^I have an article "([^"]*)" registered in the system$/) do |title|
  @article = {article: {title: title}}
  post '/articles', @article
  expect(Article.find_by(title: title)).not_to be_nil
end

Given(/^the article "([^"]*)" isn’t marked as sent$/) do |title|
  @article = Article.find_by(title: title)
  @article.mark = false
  @article.save
  expect(Article.where(mark: false)).not_to be_empty
end

When(/^I try to send an email with the subject "([^"]*)" and the message "([^"]*)"$/) do |subject, message|
  @email = {email: {subject: subject, message: message}}
  post '/emails', @email
end

Then(/^an email is sent to the donors with subject "([^"]*)" and the message "([^"]*)"$/) do |subject, message|
  expect(Email.find_by(subject: subject)).not_to be_nil
end

Then(/^the article "([^"]*)" is marked as sent\.$/) do |title|
  @email = Article.find_by(title: title)
  @email.mark = true
  @email.save
  expect(Article.where(mark: true)).not_to be_empty
end

#Scenario: Send duplicate email about notifications
Given(/^the article "([^"]*)" is marked as sent$/) do |title|
  @article = Article.find_by(title: title)
  @article.mark = true
  @article.save
  expect(Article.where(mark: true)).not_to be_empty
end

Then(/^the system will not send the email\.$/) do
  emails = get '/emails'
  !expect(emails).not_to be_empty
end

#Scenario: Send message
Given(/^I wrote an email with subject "([^"]*)"$/) do |subject|
    @email = subject
    expect(@email).not_to be_nil
end

When(/^I try to send the email "([^"]*)"$/) do |subject|
  @email = {email: {subject: subject}}
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

#Scenario: Send email with subject in blank
When(/^I try to send the email with the subject "([^"]*)"$/) do |subject|
  @email = {email: {subject: subject, message: message}}
  post '/emails', @email
end


#GUI SCENARIOS
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
Then(/^I can see an error message\.$/) do
  expect(page).to have_content("Subject can't be blank")
end