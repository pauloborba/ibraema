Feature: Newsletter management
AS A system administrator
I WANT TO insert and update articles
SO THAT I can use the broadcast feature to interact with donors and the public


  Scenario: Insert an article
    Given there is an article with the title “Treinamento em escola do Amapá”
    And there is no other articles with the title “Treinamento em escola do Amapá”
    When I register the article with the title “Treinamento em escola do Amapá”
    Then the article with the title “Treinamento em escola do Amapá” is registered in the system
