@article = {}
@newArticle = {}
@img = ''
@id


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

#Scenario: Insert a non-image file as for article
Given(/^I create an article with image "([^"]*)" and title "([^"]*)"$/) do |img, title|
  @article = {article: {title: title, img_path: img}}
end

#Scenario: Insert a duplicate article & Insert an article whitout a title
Given(/^there is an article with the title (.*) registered in the system$/) do |title|
  @article = {article: {title: title}}
  post '/articles', @article
end

Given(/^I create an article without a title$/) do
  @article = {article: {title: ""}}
end

When(/^I try to register the article with the title (.*)$/) do |title|
  post '/articles', @article
end

Then(/^the article with the title (.*) is not registered in the system twice$/) do |title|
  s = "title = '" + title + "'"
  expect(Article.count(s)).to eq(1)
end

Then(/^the article with the title (.*) is not registered in the system$/) do |title|
  s = "title = '" + title + "'"
  expect(Article.find_by(title: title)).to be_nil
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
