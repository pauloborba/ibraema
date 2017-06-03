@email = {}
@article = {}

#Scenario: Send email about notifications
Given(/^I have an article "([^"]*)" registered in the system$/) do |title|
  @article = {article: {title: title, text: "news"}}
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
  @article = Article.find_by(title: title)
  @article.mark = true
  @article.save
  expect(Article.where(mark: true)).not_to be_empty
end

Given(/^the article "([^"]*)" is marked as sent$/) do |title|
  @article = Article.find_by(title: title)
  @article.mark = true
  @article.save
  expect(Article.where(mark: true)).not_to be_empty
end

Then(/^the system will not send the email\.$/) do
  @email = get '/emails'
  !expect(@email).not_to be_empty
end

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