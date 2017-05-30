Given /^there is an article with the title (.*)$/ do |title|
  text = "This is a test text"
  @article = {title: title, text: text}
end

Given /^there is no other articles with the title (.*)$/ do |title|
  if(!Article.where(title: title).empty?)
    fail("There is an article with the title" + title)
  end
end

When(/^I register the article with the title (.*)$/) do |title|
  text = "This is a test text"
  @article = {title: title, text: text}
end

Then /^the article with the title (.*) is registered in the system$/ do |title|
  Article.create(title: title, text: "This is text")
  puts Article
end
