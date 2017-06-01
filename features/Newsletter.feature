Feature: Newsletter management
  AS A system administrator
  I WANT TO insert and update articles
  SO THAT I can use the broadcast feature to interact with donors and the public

  Scenario: Insert an article
    Given I create an article with the title "Treinamento em escola do Amapá"
    And the system has no articles with the title "Treinamento em escola do Amapá"
    When I register the article with the title "Treinamento em escola do Amapá"
    Then the article with the title "Treinamento em escola do Amapá" is registered in the system

  Scenario: Insert a duplicate article
    Given there is an article with the title "Treinamento em escola do Amapá" registered in the system
    When I try to register the article with the title "Treinamento em escola do Amapá"
    Then the article with the title "Treinamento em escola do Amapá" is not registered in the system

  Scenario: Insert an article without a title
    Given I create an article with the title ""
    When I try to register the article with the title ""
    Then the article with the title "" is not registered in the system

  Scenario: Update articles
    Given there is an article with the title "Treinamento em escola do Amapá" registered in the system
    And I try to edit the article with the title "Treinamento em escola do Amapá"
    When I change the title of article "Treinamento em escola do Amapá" to "Mudanças para o futuro"
    Then the changes on the article "Treinamento em escola do Amapá" are stored on the system

  Scenario: New article inserted - GUI
    Given I am at the "articles" page
    And The article with title "Treinamento em escola do Amapá" does not appear in the articles list
    When I select the "New Article" option
    And I enter an article with title "Treinamento em escola do Amapá" with text "Novo treinamento realizado em escola do Amapá foi um sucesso"
    Then I see a confirmation message

  Scenario: Insert a duplicate article - GUI
    Given I am at the "articles" page
    And The article with title "Analfabetismo no Brasil reduz em 30% em um ano" appears in the articles list
    When I select the "New Article" option
    And I enter an article with title "Analfabetismo no Brasil reduz em 30% em um ano" with text "Nossa missão vem sendo revelada um sucesso"
    Then I see a repeated article error message
