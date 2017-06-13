Feature: Media system
As A registered facilitator
I want to access books from the coaching
So that I can review and study concepts taught by the organization

@controller @media @media1
Scenario: Add a Book
Given the book with title "Historia do analfabetismo" and version "1" is not registered in the system
When I try to register the book with title "Historia do analfabetismo" version "1"
Then the book with title "Historia do analfabetismo" version "1" is registered in the system

@controller @media @media2
Scenario: Add a duplicate book
Given the book with title "Historia do analfabetismo" version "1" is already in the system
When I try to register the book with title "Historia do analfabetismo" version "1"
Then the book with title "Historia do analfabetismo" version "1" is not registered in the system twice

@controller @media @media3
Scenario: Add a book without a title
Given the book with title "" is not in the system
When I try to register the book with title ""
Then the book with title "" is not registered in the system

@controller @media @media4
Scenario: Update Books
Given the book with title "Historia do analfabetismo" version "1" is already in the system
When I update the book with title "Historia do analfabetismo" to version "2"
Then the book with title "Historia do analfabetismo" version "2" is registered in the system

@gui @media @media5
Scenario: Add a book - GUI
Given I am at the "books" menu
And The book with title "Historia do analfabetismo" and version "1" does not appear in the "books" list
And I go to the "new" menu
When I fill in the name and the version
And I click the "Create Book" button
Then I see a confirmation message
And I see the "books" menu

@gui @media @media6
Scenario: Add a duplicate book - GUI
Given I am at the "books" menu
And The book with title "Historia do analfabetismo" version "1" is already in the "books" list
And I go to the "new" menu
When I fill in the name and the version
And I click the "Create Book" button
Then I see a duplicate book inserted error message
And I see the "books" menu

@gui @media @media7
Scenario: Add a book without a title - GUI
Given I am at the "books" menu
And The book with title "" version "1" does not appear in the "books" list
And I go to the "new" menu
When I fill in the name and the version
And I click the "Create Book" button
Then I see an invalid book name error message
And I see the "books" menu

@gui @media @media8
Scenario: Update Books - GUI
Given I am at the "books" menu
And The book with title "Historia do analfabetismo" version "1" is already in the "books" list
And I am redirected to the "edit" menu
When I fill in the name and the version
And I click the "Update Book" button
Then I see an update message
And I see the "books" menu
