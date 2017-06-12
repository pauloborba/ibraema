Feature: Coaching Management
AS A system manager
I WANT TO register coaching activities with an institution or individual
SO THAT I can grant access to facilitator And keep a history of coaching activities

@coachings @controller @coaching1
Scenario: Register a coaching
Given "escola do Amapá" with cnpj "98688378000124" is registered as a partner
When I register a coaching activity starting at day "20/05/2017" and finishing at "23/05/2017" at institution "escola do Amapá"
Then the coaching activity is register on the system
And it belongs to institution "escola do Amapá"

@coachings @controller @coaching2
Scenario: Register a facilitator to an existing coaching
Given "escola do Amapá" with cnpj "98688378000124" is registered as a partner
And the coaching activity at "escola do Amapá" starting at "20/03/2017" and finishing at "22/03/2017" is registered on the system
And the facilitator with name "joao" and cpf "123.456.789.14" is not registered on coaching activity at "escola do Amapá"
When I register the facilitator with name "joao" and cpf "123.456.789.14" at coaching activity at "escola do Amapá"
Then the facilitator is registered on the coaching activity at "escola do Amapá".

@coachings @controller @coaching3
Scenario: Unregister a single facilitator of an existing coaching
Given "escola do Amapá" with cnpj "98688378000124" is registered as a partner
And the coaching activity at "escola do Amapá" starting at "20/03/2017" and finishing at "22/03/2017" is registered on the system
And the facilitator with name "jaum" and CPF "123.456.789-12" is registered on the coaching
When I unregister the facilitator with cpf "123.456.789-12" from coaching activity at "escola do Amapá"
Then the facilitator with cpf "123.456.789-12" is no longer at the coaching activity

@coachings @controller @coaching4
Scenario: Facilitator signed up to a coaching activity twice
Given "escola do Amapá" with cnpj "98688378000124" is registered as a partner
And the coaching activity at "escola do Amapá" starting at "20/03/2017" and finishing at "22/03/2017" is registered on the system
And the facilitator with name "jaum" and CPF "123.456.789-12" is registered on the coaching
When I register the facilitator with name "jaum" and cpf "123.456.789-12" at coaching activity at "escola do Amapá"
Then the facilitator with cpf "123.456.789-12" only appears once on the coaching activity facilitators list

Scenario: New institution registered
Given I am at the "institutions" page
And I select "New institution"
And I fill the field "name" with "escola do amapa"
And I fill the field "cnpj" with "12093810"


@coachings @gui @coaching5
Scenario: New coaching registered
Given I am at the "Register coaching activity" page
When I select the partner institution "escola do Amapá"
And I fill the facilitators infos, name: "João Filipe Moura"
And CPF: "123.456.789-10"
And I create a new coaching activity at "escola do Amapá"
Then I see a confirmation message
And I see the coaching activity at "escola do Amapá" details
And the facilitator with cpf "123.456.789-10" is on the facilitators list

@coachings @gui @coaching6
Scenario: New facilitator registered to an existing coaching
Given I am at the "Coaching activities" page, under the sub-page "escola do Amapá"
When I register a new facilitator with name: "Ramon Saboya"
And CPF: "321.654.789-78"
Then I see a confirmation message
And I see the coaching activity at "escola do Amapá" updated details

@coachings @gui @coaching7
Scenario: Facilitator unregistered of an existing coaching
Given I am at the "Coaching activities" page, under the sub-page "escola do Amapá"
And the facilitator with name: "Ramon Saboya" And CPF: "321.654.789-78" is registered the coaching activity at "escola do Amapá"
When I unregister the facilitator with name: "Ramon Saboya"
And CPF: "321.654.789-78"
Then I see a confirmation message
And I see facilitator "Ramon Saboya" on coaching activity at "escola do Amapá" details
