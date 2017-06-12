@donation
Feature: Donation system
  AS A person or company with donation intent
  I WANT TO donate to the organization
  SO THAT I can get updates and access to statistics of the organization related activities

  # Also applies to Company donation
  @controller @donation1
  Scenario Outline: Person donation is confirmed by payment gateway
    Given Person with name "<NAME>", "<CPF>" and "<EMAIL>" is registered in the system
    And Person "<NAME>" is not marked as a donor
    When A donation of "<AMOUNT>" reais from person "<NAME>" is confirmed by payment gateway
    Then Person "<NAME>" is marked as a donor
    
    # Fake CPF values
    Examples:
      | NAME                   | CPF            | EMAIL             | AMOUNT |
      | Douglas Soares Lins    | 105.473.572-64 | dsl@cin.ufpe.br   | 1.65   |
      | João Filipe Moura      | 743.762.732-17 | jfmrm@cin.ufpe.br | 15.98  |
      | Luiz Henrique Oliveira | 946.583.189-67 | lhsgo@cin.ufpe.br | 17.90  |
      | Luiz Henrique Tavares  | 467.132.198-00 | lhtc@cin.ufpe.br  | 27.61  |
      | Ramon de Saboya        | 264.497.216-37 | rsg3@cin.ufpe.br  | 123.36 |
      | Rodrigo Cunha          | 489.319.764-41 | rcs8@cin.ufpe.br  | 100.00 |
  
  @controller @donation2
  Scenario Outline: Non-sponsor company donation is confirmed by payment gateway
    Given Company with name "<NAME>", "<CNPJ>" and "<EMAIL>" is registered in the system
    And Company "<NAME>" is not marked as a sponsor
    When A donation of "<AMOUNT>" reais from company "<NAME>" is confirmed by payment gateway
    Then Company "<NAME>" is <MARKED> as a <TYPE>
    
    # Sponsor types are:
    # - Bronze (donations of 100.00 or more reais)
    # - Silver (donations of 1000.00 or more reais)
    # - Gold (donations of 10000.00 or more reais)
    # Fake CNPJ and email values
    Examples:
      | NAME     | CNPJ               | EMAIL               | AMOUNT   | MARKED           | TYPE           |
      | Mr. Mix  | 65.492.248/6473-05 | mrmix@gmail.com     | 60.00    | still not marked | sponsor        |
      | Fiat     | 95.000.498/2167-60 | fiat@fiat.com.br    | 780.00   | marked           | Bronze sponsor |
      | Facebook | 15.648.267/6482-02 | change@facebook.com | 5000.00  | marked           | Silver sponsor |
      | Google   | 32.659.489/4697-21 | social@google.com   | 16000.00 | marked           | Gold sponsor   |
  
  @gui @donation3
  Scenario Outline: Person created is visible under the User index
    Given I am at the "<FIRST_PAGE>" page
    When I select "New <TYPE>"
    And I fill the field "Name" with the text "<NAME>"
    And I fill the field "<FIRST_ID_TYPE>" with the text "<IDENTIFIER>"
    And I fill the field "Email" with the text "<EMAIL>"
    And I select "Create <TYPE>"
    And I go to the "<SECOND_PAGE>" page
    Then I <VISIBILITY> see the user with name "<NAME>", <SECOND_ID_TYPE> "<IDENTIFIER>" and email "<EMAIL>"
    
    Examples:
      | FIRST_PAGE | SECOND_PAGE | TYPE    | NAME                | FIRST_ID_TYPE | SECOND_ID_TYPE | IDENTIFIER         | EMAIL             | VISIBILITY |
      | people     | users       | Person  | Douglas Soares Lins | CPF           | identifier     | 105.473.572-64     | dsl@cin.ufpe.br   | can        |
      | companies  | users       | Company | Mr. Mix             | CNPJ          | identifier     | 65.492.248/6473-05 | mrmix@gmail.com   | can        |
      | people     | companies   | Person  | João Filipe Moura   | CPF           | CNPJ           | 743.762.732-17     | jfmrm@cin.ufpe.br | can not    |
      | companies  | people      | Company | Fiat                | CNPJ          | CPF            | 95.000.498/2167-60 | fiat@fiat.com.br  | can not    |