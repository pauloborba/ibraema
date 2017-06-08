@books = {}
#GUI SCENARIOS

# ADD A BOOK

Given(/^I am at the "([^"]*)" menu$/) do |menu|
  visit '/' + menu
end

Given(/^The book with title "([^"]*)" and version "([^"]*)" does not appear in the "([^"]*)" list$/) do |name, version, menu|
  @name = name
  @version = version
  expect(page).not_to have_content(@name)
end

Given(/^I go to the "([^"]*)" menu$/) do |menu|
  visit '/books/' + menu
end

When(/^I fill in the name and the version$/) do
  fill_in "Nome", with: @name
  fill_in "Versao", with: @version
end

When(/^I click the "([^"]*)" button$/) do |button|
  click_button(button)
end

Then(/^I see a confirmation message$/) do
  expect(page).to have_content("Book was successfully created.")
end

Then(/^I see the "([^"]*)" menu$/) do |menu|
  visit '/' + menu
end

# ADD A DUPLICATE BOOK

Given(/^The book with title "([^"]*)" version "([^"]*)" is already in the "([^"]*)" list$/) do |name, version, menu|
  @name = name
  @version = version
  visit '/' + menu + '/new'
  fill_in "Nome", with: @name
  fill_in "Versao", with: @version
  click_button("Create Book")
  expect(page).to have_content("Book was successfully created.")
end

Then(/^I see a duplicate book inserted error message$/) do
  expect(page).to have_content("Livro ja cadastrado.")
end

# ADD A BOOK WITHOUT A TITLE

Given(/^The book with title "([^"]*)" version "([^"]*)" does not appear in the "([^"]*)" list$/) do |name, version, menu|
  @name = name
  @version = version
  expect(page).not_to have_content(@version)
end

When(/^I fill in the name with "([^"]*)" and the version with "([^"]*)"$/) do |name, version|
  fill_in "Nome", with: @name
  fill_in "Versao", with: @version
end

Then(/^I see an invalid book name error message$/) do
  expect(page).to have_content("Nome é obrigatório")
end

#UPDATE BOOK

Given(/^I am redirected to the "([^"]*)" menu$/) do |menu|
  @books = Book.find_by(nome: @name)
  visit '/books/' + @books.id.to_s + '/' + menu
end

When(/^I request to update the book$/) do
  fill_in "Nome", with: @name
  fill_in "Versao", with: @version
end

Then(/^I see an update message$/) do
expect(page).to have_content("Book was successfully updated.")
end

