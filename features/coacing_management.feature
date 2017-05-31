Feature: Coaching Management
AS A system manager
I WANT TO register coaching activities with an institution or individual
SO THAT I can grant access to facilitator And keep a history of coaching activities

@a
Scenario: Register a coaching
Given "escola do Amapá" with cnpj "98688378000124" is registered as a partner
And the facilitator with name "jaum" and CPF "123.456.789-12" is registered
And the facilitator with name "ramao" and CPF "543.678.234-00" is registered
When I register a coaching activity starting at day "20/05/2017" and finishing at "23/05/2017" at institution "escola do Amapá"
Then the coaching activity is register on the system
And the coaching activity at "escola do Amapá" has the facilitator with CPF "123.456.789-12"
And the coaching activity at "escola do "Amapá" has the facilitator with CPF "543.678.234-00"

@b
Scenario: Register a facilitator to an existing coaching
Given there is a coaching activity at "escola do Amapá"
And the facilitator is not registered on coaching activity at "escola do Amapá"
When I register the facilitator with name "Joao Moura"
And CPF "098.890.432-12" on coaching activity at "escola do Amapá"
Then the facilitator is registered on the coaching activity at "escola do Amapá".

@c
Scenario: Unregister a single facilitator of an existing coaching
Given there is a coaching activity at  "escola do Amapá" 
And the facilitator "Joao Moura" 
And CPF "098.890.432-12" to the existing coaching activity at "escola do Amapá".
When I unregister the facilitator with name "Joao Moura" 
And CPF "098.890.432-12" from the coaching activity at "escola do Amapá"
Then the facilitator is unregistered from the coaching activity at "escola do Amapá".

@d
Scenario: New coaching registered
Given I am at the "Register coaching activity" page
When I select the partner institution "escola do Amapá"
And I fill the facilitators infos, name: "João Filipe Moura" 
And CPF: "123.456.789-10"
And I create a new coaching activity at "escola do Amapá"
Then I see a confirmation message
And I see the coaching activity at "escola do Amapá" details
And the facilitator with cpf "123.456.789-10" is on the facilitators list

@e
Scenario: New facilitator registered to an existing coaching
Given I am at the "Coaching activities" page, under the sub-page "escola do Amapá"
When I register a new facilitator with name: "Ramon Saboya" 
And CPF: "321.654.789-78"
Then I see a confirmation message
And I see the coaching activity at "escola do Amapá" updated details

@f
Scenario: Facilitator unregistered of an existing coaching
Given I am at the "Coaching activities" page, under the sub-page "escola do Amapá"
And the facilitator with name: "Ramon Saboya" And CPF: "321.654.789-78" is registered the coaching activity at "escola do Amapá"
When I unregister the facilitator with name: "Ramon Saboya" 
And CPF: "321.654.789-78"
Then I see a confirmation message
And I see facilitator "Ramon Saboya" on coaching activity at "escola do Amapá" details