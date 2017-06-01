@article = {}
@newArticle = {}
@id

# CONTROLLER SCENARIOS
#Scenario: Insert an article
Given(/^I create an article with the title (.*)$/) do |title|
  @article = {article: {title: title}}
end

Given(/^the system has no articles with the title (.*)$/) do |title|
  expect(Article.find_by(title: title)).to be_nil
end

When(/^I register the article with the title (.*)$/) do |title|
  post '/articles', @article
end

Then(/^the article with the title (.*) is registered in the system$/) do |title|
  expect(Article.find_by(title: title)).not_to be_nil
end

#Scenario: Insert a duplicate article & Insert an article whitout a title
Given(/^there is an article with the title (.*) registered in the system$/) do |title|
  @article = {article: {title: title}}
  post '/articles', @article
  expect(Article.find_by(title: title)).not_to be_nil
end

When(/^I try to register the article with the title (.*)$/) do |title|
  @article = {article: {title: title}}
  post '/articles', @article
end

Then(/^the article with the title (.*) is not registered in the system$/) do |title|
  s = "title = '" + title + "'"
  expect(Article.count(s)).to eq(1)
end

#Scenario: Update articles
Given(/^I try to edit the article with the title (.*)$/) do |title|
  @article = Article.find_by(title: title)
end

When(/^I change the title of article (.*) to (.*)$/) do |t1,t2|
  @newArticle = {article: {title: t2}}
  @id = Article.find_by(title: t1).id
  put '/articles/' + @article.id.to_s(), @newArticle
end

Then(/^the changes on the article (.*) are stored on the system$/) do |title|
  expect(Article.find_by(title: title)).to be_nil
  expect(Article.find(@id)).not_to be_nil
end

# END OF CONTROLLER SCENARIOS

# GUI SCENARIOS
#Scenario: New article inserted - GUI
Given(/^I am at the "(.*)" page$/) do |page|
  visit '/' + page
end

Given(/^The article with title "(.*)" does not appear in the articles list$/) do |title|
  expect(page).to_not have_content(title)
end

When(/^I select the "(.*)" option$/) do |option|
  click_on(option)
end

When(/^I enter an article with title "(.*)" with text "(.*)"$/) do |title,text|
  fill_in('Title', with: title)
  fill_in('Text', with: text)
  click_on('Create Article')
end

Then(/^I see a confirmation message$/) do
  expect(page).to have_content("Article was successfully created.")
end

#Scenario: Insert a duplicate article - GUI
Given(/^The article with title "([^"]*)" appears in the (.*) list$/) do |title,vpage|
  @article = {article: {title: title}}
  post '/articles', @article
  visit '/' + vpage
  expect(page).to have_content(title)
end

Then(/^I see a repeated article error message$/) do
  expect(page).to have_content("Title has already been taken")
end
