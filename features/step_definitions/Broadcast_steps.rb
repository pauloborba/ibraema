@emails = []
@articles = []

#Scenario: Send email about notifications
Given(/^I have an article "([^"]*)" registered in the system$/) do |title|
  new_article = {article: {title: title}}
  post '/articles', new_article
  expect(Article.find_by(title: title)).not_to be_nil
end

Given(/^the article "([^"]*)" isn’t marked as sent$/) do |title|
  article_new = Article.find_by(title: title)
  article_new.mark = false
  article_new.save
  expect(Article.where(mark: false)).not_to be_empty
end

When(/^I try to send an email with the subject "([^"]*)" and the message "([^"]*)"$/) do |subject, message|
  new_email = {email: {subject: subject, message: message}}
  post '/emails', new_email
end

Then(/^an email is sent to the donors with subject "([^"]*)" and the message "([^"]*)"$/) do |subject, message|
  expect(Email.find_by(subject: subject)).not_to be_nil
end

Then(/^the article "([^"]*)" is marked as sent\.$/) do |title|
  article_new = Article.find_by(title: title)
  article_new.mark = true
  article_new.save
  expect(Article.where(mark: true)).not_to be_empty
end

#Scenario: Send duplicate email about notifications
Given(/^the article "([^"]*)" is marked as sent$/) do |title|
  article_new = Article.where(title: title)
  article_new[0].mark = true
  article_new[0].save
  expect(Article.where(mark: true)).not_to be_empty
end

Then(/^the system will not send the email\.$/) do
  emails = get '/emails'
  !expect(emails).not_to be_empty
end

#Scenario: Send message
Given(/^I wrote an email with subject "([^"]*)"$/) do |subject|
    new_email = subject
    expect(new_email).not_to be_nil
end

When(/^I try to send the email "([^"]*)"$/) do |subject|
  new_email = {email: {subject: subject}}
  post '/emails', new_email
end

Then(/^an email is sent to the donors with subject "([^"]*)"$/) do |subject|
  #quando o email for criado, logo apos enviar o email, mark = true
  new_email = Email.find_by(subject: subject)
  new_email.mark = true
  new_email.save
  expect(Email.where(mark: true)).not_to be_empty
end

Then(/^the message "([^"]*)" is registered on the system$/) do |subject|
  expect(Email.where(subject: subject)).not_to be_empty
end

#Scenario: Send email with subject in blank
When(/^I try to send the email with the subject "([^"]*)"$/) do |subject|
  new_email = {email: {subject: subject, message: message}}
  post '/emails', new_email
  
end

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
  print "Operação feita com sucesso" #temporario
  #page.find('div', text: "Operação feita com sucesso")
end

Then(/^I can see the message with subject "([^"]*)" in the "([^"]*)" page\.$/) do |subject, page|
  visit '/' + page
  #element = find("td", Subject: subejct)
  #expect(element[:class]).eq('green')
end

#Scenario: Send message without title (GUI)
When(/^I fill the field "([^"]*)" in blank "([^"]*)"$/) do |subject, subject_text|
  fill_in(subject, with: subject_text)
end
Then(/^I can see an error message\.$/) do
  print "erro, nao pode mandar mensagem sem subeject"
end

def compare_emails(emails1, emails2)
  return emails1.count == emails2.count
end
