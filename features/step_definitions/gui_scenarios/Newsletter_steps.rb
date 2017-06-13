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

When(/^I enter an article with title "(.*)" with text "(.*)" and image path "(.*)"$/) do |title,text, img|
  fill_in('Title', with: title)
  fill_in('Text', with: text)
  attach_file('article[img]', Rails.root + img)
  click_on('Create Article')
end

Then(/^I see a confirmation message$/) do
  expect(page).to have_content("Article was successfully created.")
end

#Scenario: Insert a duplicate article - GUI
Given(/^The article with title "([^"]*)" appears in the (.*) list$/) do |title,vpage|
  visit '/' + vpage + '/new'
  fill_in('Title', with: title)
  fill_in('Text', with: text)
  click_on('Create Article')
  visit '/' + vpage
end

Then(/^I see a repeated article error message$/) do
  expect(page).to have_content("Title has already been taken")
end

#Scenario: View the correspondent image for article - GUI
Then(/^I see a not\-image error message$/) do
  expect(page).to have_content("Please, upload JPG, JPEG or PNG images only.")
end
