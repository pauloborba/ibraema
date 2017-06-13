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

@coachings @gui @coaching5
Scenario: New institution registered
Given I am at the "institutions" page
When I select "New Institution"
And I fill the field "Name" with "escola do amapa"
And I fill the field "Cnpj" with "12093810"
And I select "Create Institution"
Then I see successful message "Institution was successfully created."

@coachings @gui @coaching6
Scenario: New coaching registered
Given I am at the "institutions" page
And I select "New Institution"
And I fill the field "Name" with "escola do amapa"
And I fill the field "Cnpj" with "12093810"
And I select "Create Institution"
And I am at the "institutions/1/coaching_activities" page
When I select "New Coaching Activity"
And I select "date_start" "15" from "coaching_activity_date_start_3i", "April" from "coaching_activity_date_start_2i", "2017" from "coaching_activity_date_start_1i"
And I select "date_finish" "19" from "coaching_activity_date_finish_3i", "April" from "coaching_activity_date_finish_2i", "2017" from "coaching_activity_date_finish_1i"
And I select "Create Coaching activity"
Then I see successful message "Coaching activity was successfully created."

@coachings @gui @coaching7
Scenario: New facilitator registered to an existing coaching
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
When I select "New Facilitator"
And I fill the field "Name" with "Joao"
And I fill the field "Cpf" with "123.123.123-12"
And I select "Create Facilitator"
Then I see successful message "Facilitator was successfully created."

@coachings @gui @coaching8
Scenario: Facilitator unregistered of an existing coaching
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
When I delete facilitator with cpf "123.123.123-12"
Then I see successful message "Facilitator was successfully destroyed."
