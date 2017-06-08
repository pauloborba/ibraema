Feature: Broadcast
As A system administrator
I WANT TO send message, notifications and updates to system users and the public
SO THAT I can keep the donors and the public updated with the organization actions and projects

@controller @broadcast @broadcast1
Scenario: Send email about article
Given I have an article "Ampliando Limites" registered in the system
When I try to send an email with the subject "Ampliando Limites" and the message "Novo artigo"
Then an email is sent to the donors with subject "Ampliando Limites" and the message "Novo artigo"

@controller @broadcast @broadcast2
Scenario: Send email
Given I wrote an email with subject "Obrigado por lutar contra o analfabetismo" and message "Obrigado por se juntar ao time"
When I try to send the email "Obrigado por lutar contra o analfabetismo" and message "Obrigado por se juntar ao time"
Then an email is sent to the donors with subject "Obrigado por lutar contra o analfabetismo"
And the message "Obrigado por lutar contra o analfabetismo" is registered on the system

@controller @broadcast @broadcast3
Scenario: Send email with subject in blank
Given I wrote an email with subject "" and message "Obrigado por se juntar ao time"
When I try to send the email "" and message "Obrigado por se juntar ao time"
Then the system will not send the email.

@controller @broadcast @broadcast4
Scenario: Send email with message in blank
Given I wrote an email with subject "Obrigado" and message ""
When I try to send the email "Obrigado" and message ""
Then the system will not send the email.

@gui @broadcast @broadcast5
Scenario: Send email (GUI)
Given I am at the "emails" page
When I select "New Email"
And I fill the field "Subject" with "Obrigado por lutar contra o analfabetismo"
And I fill the field "Message" with the text "Obrigado"
And I select "Create Email"
Then I can see a successful message
And I can see the message with subject "Obrigado por lutar contra o analfabetismo" in the "emails" page.

@gui @broadcast @broadcast6
Scenario: Send email without subject (GUI)
Given I am at the "emails" page
When I select "New Email"
And I fill the field "Subject" in blank ""
And I fill the field "Message" with the text "Obrigado"
And I select "Create Email"
Then I can see an error message about the subject.

@gui @broadcast @broadcast7
Scenario: Send email without message (GUI)
Given I am at the "emails" page
When I select "New Email"
And I fill the field "Subject" with "Nova Noticia"
And I fill the field "Message" in blank ""
And I select "Create Email"
Then I can see an error message about the message.

@gui @broadcast @broadcast8
Scenario: Emails sent (GUI)
Given the email with subject "Obrigado por lutar contra o analfabetismo" and message "Obrigado" was sent to users
And the email with subject "Novas atividade realizadas" and message "Hoje realizamos uma nova atividade" was sent to users
When I go to the "emails" page
Then I can see a list with the subjects "Obrigado por lutar contra o analfabetismo" and "Novas atividade realizadas"
