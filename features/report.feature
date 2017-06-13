@report
Feature: Reports management
AS A system administrator
I WANT TO generate quarterly reports
SO THAT I can keep track of past activities

#Controller scenarios
@controller @report1
Scenario: Generate an Accounting report
  Given The user "Douglas" is registered in the system
  And The user "João Filipe" is registered in the system
  And The user "Luiz Henrique Oliveira" is registered in the system
  And The user "Luiz Henrique Tavares" is registered in the system
  And The user "Ramon" is registered in the system
  And The user "Rodrigo" is registered in the system
  And User "Douglas" made a donation of "1.45" at "10:50 30/09/2015"
  And User "João Filipe" made a donation of "10.75" at "11:50 30/06/2016"
  And User "Luiz Henrique Oliveira" made a donation of "50.42" at "12:40 30/07/2016"
  And User "Luiz Henrique Tavares" made a donation of "7.00" at "17:00 15/08/2016"
  And User "Ramon" made a donation of "12.85" at "12:20 21/09/2016"
  And User "Rodrigo" made a donation of "16.29" at "08:10 12/12/2016"
  When I request the Accounting report from "July 2016" to "September 2016"
  Then I recieve a Accounting report with data from "July 2016" to "September 2016"
  
@controller @report2
Scenario: Generate a Donators report
  Given a Person with name "Luiz Henrique", cpf "164.630.470-58" and email "luiz@hotmail.com" is registered
  And a Person with name "Douglas Soares", cpf "771.951.430-07" and email "douglas@hotmail.com" is registered
  And a Person with name "Ramon Saboya", cpf "567.484.270-10" and email "ramon@hotmail.com" is registered
  And a Company with name "Alimentos S.A.", cnpj "63.521.335/0001-75" and email "alimentos@alimentos.com" is registered
  And a Company with name "Eletro Sport", cnpj "61.086.489/0001-50" and email "sport@eletro.com" is registered
  And a Company with name "Delta Studios", cnpj "26.342.422/0001-39" and email "delta@studios.com" is registered
  And User "Luiz Henrique" made a donation of "50.42" at "10:50 03/06/2017"
  And User "Douglas Soares" made a donation of "13.45" at "10:50 01/06/2017"
  And User "Ramon Saboya" made a donation of "16.05" at "10:50 01/06/2015"
  And User "Alimentos S.A." made a donation of "12000.00" at "10:50 27/05/2017"
  And User "Eletro Sport" made a donation of "9000.00" at "10:50 30/05/2017"
  When I request the Donor report 
  Then I receive a Donor report with all donors 
  And the User "Ramon Saboya" is not in it
  And the User "Delta Studios" is not in it
  
@controller @report3
Scenario: Generate a Coaching Activity report
  Given "Alumiar" with cnpj "31022371000106" is registered as a partner
  And the coaching activity at "Alumiar" starting at "17/04/2017" and finishing at "21/04/2017" is registered on the system
  And the facilitator with name "Roberto" and CPF "85481996448" is registered on the coaching
  And the facilitator with name "Milton" and CPF "84786467790" is registered on the coaching
  And the facilitator with name "Diana" and CPF "16256143493" is registered on the coaching
  When I request the Coaching Activity report from "April 2017"
  Then I recieve a Coaching Activity report with data from "April 2017"
  
#GUI Scenarios
@GUI @report4
Scenario: Download Coaching Activity report
  Given I am at the "institutions" page
  And I select "New Institution"
  And I fill the field "Name" with "escola do amapa"
  And I fill the field "Cnpj" with "12093810"
  And I select "Create Institution"
  And I am at the "institutions/1/coaching_activities" page
  And I select "New Coaching Activity"
  And I select "date_start" "15" from "coaching_activity_date_start_3i", "April" from "coaching_activity_date_start_2i", "2017" from "coaching_activity_date_start_1i"
  And I select "date_finish" "19" from "coaching_activity_date_finish_3i", "April" from "coaching_activity_date_finish_2i", "2017" from "coaching_activity_date_finish_1i"
  And I select "Create Coaching activity"
  And I am at the "institutions/1/coaching_activities/1/facilitators" page
  And I select "New Facilitator"
  And I fill the field "Name" with "Joao"
  And I fill the field "Cpf" with "123.123.123-12"
  And I select "Create Facilitator"
  And I select "Back"
  And I select "Back"
  And I select "Back"
  When I select "Create Report"
  And I select "Download"
  Then The download starts
  
