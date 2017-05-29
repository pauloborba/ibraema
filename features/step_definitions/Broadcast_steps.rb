@emails = []
@articles = []

#Scenario: Send email about notifications
Given(/^I have an article "([^"]*)" registered in the system$/) do |arg1|
  new_article = {article: {title: arg1}}
  post '/articles', new_article
  assert !articles.where(title: arg1).empty?
end

When(/^the article "([^"]*)" isn’t marked as sent$/) do |arg1|
  article_new = article.where(title: arg1)
  article_new.mark = false
  assert articles.where(mark: true).empty?
end

Then(/^an email is sent to the donors with title "([^"]*)"$/) do |arg1|
  new_email = {email: {subject: arg1}}
  post '/emails', new_email
  assert !emails.where(mark: true).empty?
end

Then(/^the article "([^"]*)" is marked as sent\.$/) do |arg1|
  article_new = article.where(title: arg1)
  article_new.mark = true
  assert articles.where(mark: false).empty?
end

#Scenario: Send duplicate email about notifications
#Given deste é igual ao primeiro
When(/^the article "([^"]*)" is marked as sent$/) do |arg1|
  article_new = article.where(title: arg1)
  article_new.mark = true
  assert !articles.where(mark: true).empty?
end

Then(/^the system will not send the email\.$/) do
    emails = Email.all
    assert compare_emails(emails, @emails)
end

#Scenario: Send message
Given(/^I wrote a message with title "([^"]*)"$/) do |arg1|
    new_email = arg1
    assert new_email = arg1
end

Given(/^there is no other message with the title "([^"]*)"  in the system$/) do |arg1|
  assert emails.where(subject: arg1).count == 0
end

When(/^I try to register the message "([^"]*)"$/) do |arg1|
  new_email = {email: {subject: arg1}}
  post '/emails', new_email

end

Then(/^the message "([^"]*)" is registered on the system$/) do |arg1|
  assert !emails.where(subject: arg1).empty?
end

Then(/^the message "([^"]*)" is marked as sent\.$/) do |arg1|
  emails.where(subject: arg1).mark = true
  assert emails.where(subject: arg1).mark
end

#Scenario: Send duplicate message
Given(/^I have a message with the title "([^"]*)" registered in the system$/) do |arg1|
  new_email = {email: {subject: arg1}}
  post '/emails', new_email
  assert !emails.where(subject: arg1).empty?
end

Given(/^I wrote a message with the title "([^"]*)"$/) do |arg1|
  new_message = arg1
  assert new_email = arg1
  #em relacao a isso aq estou em duvida!
end

#Scenario: Send message (GUI)
Given(/^I am at the "([^"]*)" page$/) do |arg1|
   visit '/arg1'
end

When(/^I select "([^"]*)"$/) do |arg1|
   click_on(arg1)
end

When(/^I fill the field "([^"]*)" with "([^"]*)"$/) do |arg1, arg2|
  fill_in('arg1', with: arg2)

end

When(/^I fill the field "([^"]*)" with the text "([^"]*)"$/) do |arg1, arg2|
  fill_in('arg1', with: arg2)
  click_button('Send')

end

Then(/^I can see a successful message$/) do
  page.find('div', text: "Operação feita com sucesso")
end

Then(/^I can see the message with title "([^"]*)" at the "([^"]*)" area in the "([^"]*)" page\.$/) do |arg1, arg2, arg3|
  visit '/arg3/arg2'
  element = find("td", subject: arg1)
  assert element[:class] == 'green' #nao quero colocar green, quero so colcoar como se fosse um link normal
end

#Scenario: Send duplicate message (GUI)
Given(/^there is a message with title "([^"]*)"  at the "([^"]*)" area$/) do |arg1, arg2|
  visit '/Broadcast/arg2'
  element = find("td", subject: arg1)
  assert element[:class] == 'green'
end

Then(/^I can see an error message\.$/) do
  page.find('div', text: "Error, Operação inválida")
end

#Scenario: Send message without title (GUI)
When(/^I fill the field "([^"]*)" without title "([^"]*)"$/) do |arg1, arg2|
  fill_in('arg1', with: arg2)
end

def compare_emails(emails1, emails2)
  return emails1.count == emails2.count
end
