@books = {}

#CONTROLLER SCENARIOS

#ADD A BOOK
Given(/^the book with title "([^"]*)" and version "([^"]*)" is not registered in the system$/) do |name, version|
  book_new = {book:{nome: name, versao: version}}
  @books = book_new
  expect(Book.where(nome: name)).to be_empty
end

When(/^I try to register the book with title "([^"]*)" version "([^"]*)"$/) do |name, version|
  post '/books', @books
  @books = Book.find_by(nome: name)
end

Then(/^the book with title "([^"]*)" version "([^"]*)" is registered in the system$/) do |name, version|
  expect(Book.find_by(id: @books.id)).not_to be nil
end

#ADD A DUPLICATE BOOK

Given(/^the book with title "([^"]*)" version "([^"]*)" is already in the system$/) do |name, version|
  book_new = {book:{nome: name, versao: version}}
  post '/books', book_new
  @books = book_new
  expect(Book.where(nome:name)).not_to be nil
end

Then(/^the book with title "([^"]*)" version "([^"]*)" is not registered in the system twice$/) do |name, version|
  expect(Book.where(nome: name).count).to eq(1)
end

#ADD A BOOK WITHOUT A TITLE

Given(/^the book with title "([^"]*)" is not in the system$/) do |name|
  book_new = {book:{nome: name, versao: 1}}
  @books = book_new
  expect(Book.where(nome: name)).to be_empty
end

When(/^I try to register the book with title "([^"]*)"$/) do |name|
  post '/books', @books
end

Then(/^the book with title "([^"]*)" is not registered in the system$/) do |name|
  expect(Book.where(nome: name)).to be_empty
end

#UPDATE BOOK

When(/^I update the book with title "([^"]*)" to version "([^"]*)"$/) do |name, version|
  @books = Book.find_by(nome:name)
  book_update = {book:{nome: name, versao: version}}
  put '/books/' + @books.id.to_s, book_update
end

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
  expect(page).to have_content("Um Livro precisa de um nome.")
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
