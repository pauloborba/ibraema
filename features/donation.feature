Feature: Donation system
AS A individual, institution or company with donation intent
I WANT TO donate to the organization
SO THAT I can get updates and access to statistics of the organization related activities

  Scenario: Subscribe for monthly donation
  Given The user "Ramon" with email "rsg3@cin.ufpe.br" is registered in the system
  And The user "Ramon" is not marked as a donor
  When User "Ramon" subscribes for a monthly donation of "1.00"
  Then User "Ramon" is marked as a donor