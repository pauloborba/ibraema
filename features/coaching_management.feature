Feature: Coaching Management
AS A system manager
I WANT TO register coaching activities with an institution or individual
SO THAT I can grant access to facilitator And keep a history of coaching activities

@controller @coaching_management @a
Scenario: Register a coaching
Given "escola do Amapá" with cnpj "98688378000124" is registered as a partner
And the facilitator with name "jaum" and CPF "123.456.789-12" is registered
When I register a coaching activity starting at day "20/05/2017" and finishing at "23/05/2017" at institution "escola do Amapá" with facilitator with cpf "123.456.789-12" to the coaching
Then the coaching activity is register on the system
And the coaching activity at "escola do Amapá" has the facilitator with CPF "123.456.789-12"
