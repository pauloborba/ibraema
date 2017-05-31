Feature: Reports management
AS A system administrator
I WANT TO generate quarterly reports
SO THAT I can keep track of past activities


	# Controller scenarios
    Scenario: Generate an expenditure report
    Given The user "Douglas" is registered in the system
    And The user "João Filipe" is registered in the system
    And The user "Luiz Henrique Oliveira" is registered in the system
    And The user "Luiz Henrique Tavares" is registered in the system
    And The user "Ramon" is registered in the system
    And The user "Rodrigo" is registered in the system
    And User "Douglas" made a donation of "1.45" at " 10:50 30/09/2015"
    And User "João Filipe" made a donation of "10.75" at "11:50 30/06/2016"
    And User "Luiz Henrique Oliveira" made a donation of "50.42" at "12:40 30/07/2016"
    And User "Luiz Henrique Tavares" made a donation of "7.00" at "17:00 15/08/2016"
    And User "Ramon" made a donation of "12.85" at "12:20 21/09/2016"
    And User "Rodrigo" made a donation of "16.29" at "08:10 12/12/2016"
	When I request the Accounting report from "July 2016" to "September 2016"
	Then I recieve a report with all data from Accounting with name "accounting.pdf"