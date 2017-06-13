Feature: Newsletter management
  AS A system administrator
  I WANT TO insert and update articles
  SO THAT I can use the broadcast feature to interact with donors and the public

  @controller @newsletter @newsletter1
  Scenario: Insert an article
    Given I create an article with the title "Treinamento em escola do Amapá"
    And the system has no articles with the title "Treinamento em escola do Amapá"
    When I register the article with the title "Treinamento em escola do Amapá"
    Then the article with the title "Treinamento em escola do Amapá" is registered in the system

  @controller @newsletter @newsletter2
  Scenario: Submit a non-image file for article
    Given I create an article with image "Treinamento.txt" and title "Treinamento em escola de Pernambuco"
    When I try to register the article with the title "Treinamento em escola de Pernambuco"
    Then the article with the title "Treinamento em escola de Pernambuco" is not registered in the system

  @controller @newsletter @newsletter3
  Scenario: Insert a duplicate article
    Given there is an article with the title "Treinamento em escola do Amapá" registered in the system
    When I try to register the article with the title "Treinamento em escola do Amapá"
    Then the article with the title "Treinamento em escola do Amapá" is not registered in the system twice

  @controller @newsletter @newsletter4
  Scenario: Insert an article without a title
    Given I create an article without a title
    When I try to register the article with the title ""
    Then the article with the title "" is not registered in the system

  @controller @newsletter @newsletter5
  Scenario: Update articles
    Given there is an article with the title "Treinamento em escola do Amapá" registered in the system
    And I try to edit the article with the title "Treinamento em escola do Amapá"
    When I change the title of article "Treinamento em escola do Amapá" to "Mudanças para o futuro"
    Then the changes on the article "Treinamento em escola do Amapá" are stored on the system

  @gui @newsletter @newsletter6
  Scenario: New article inserted - GUI
    Given I'm on the "articles" page
    And The article with title "Treinamento em escola do Amapá" does not appear in the articles list
    When I select the "New Article" option
    And I enter an article with title "Treinamento em escola do Amapá" with text "Nossa missão vem sendo revelada um sucesso" and image path "test/test.jpeg"
    Then I see a confirmation message

  @gui @newsletter @newsletter7
  Scenario: Insert a duplicate article - GUI
    Given I'm on the "articles" page
    And The article with title "Analfabetismo no Brasil reduz em 30% em um ano" appears in the articles list
    When I select the "New Article" option
    And I enter an article with title "Analfabetismo no Brasil reduz em 30% em um ano" with text "Nossa missão vem sendo revelada um sucesso" and image path "test/test.jpeg"
    Then I see a repeated article error message

  @gui @newsletter @newsletter8
  Scenario: Submit a non-image file for article - GUI
    Given I'm on the "articles" page
    When I select the "New Article" option
    And I enter an article with title "Analfabetismo no Brasil reduz em 30% em um ano" with text "Nossa missão vem sendo revelada um sucesso" and image path "test/test.txt"
    Then I see a not-image error message
