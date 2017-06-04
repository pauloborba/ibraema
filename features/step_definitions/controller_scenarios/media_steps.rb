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
  @books = Book.find_by(nome: name)
  book_update = {book:{nome: name, versao: version}}
  put '/books/' + @books.id.to_s, book_update
end

#DOWNLOAD A BOOK 

When(/^I download the book "([^"]*)" and version "([^"]*)"$/) do |name, version|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^the file "([^"]*)" is sent to the user$/) do |name|
  pending # Write code here that turns the phrase above into concrete actions
end