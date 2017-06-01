Feature: Broadcast
As A system administrator
I WANT TO send message, notifications and updates to system users and the public
SO THAT I can keep the donors and the public updated with the organization actions and projects

@a
Scenario: Send email about article
Given I have an article "Ampliando Limites" registered in the system
And the article "Ampliando Limites" isn’t marked as sent
When I try to send an email with the subject "Ampliando Limites" and the message "Novo artigo"
Then an email is sent to the donors with subject "Ampliando Limites" and the message "Novo artigo"
And the article "Ampliando Limites" is marked as sent.

@b
Scenario: Send duplicate email about article
Given I have an article "Ampliando Limites" registered in the system
And the article "Ampliando Limites" is marked as sent
When I try to send an email with the subject "Ampliando Limites" and the message "Novo artigo"
Then the system will not send the email.

@c
Scenario: Send email
Given I wrote an email with subject "Obrigado por lutar contra o analfabetismo"
When I try to send the email "Obrigado por lutar contra o analfabetismo"
Then an email is sent to the donors with subject "Obrigado por lutar contra o analfabetismo"
And the message "Obrigado por lutar contra o analfabetismo" is registered on the system

@d
Scenario: Send email with subject in blank
Given I wrote an email with subject ""
When I try to send the email with the subject ""
Then the system will not send the email.

@e
Scenario: Send message (GUI)
Given I am at the "emails" page
When I select "New Email"
And I fill the field "Subject" with "Obrigado por lutar contra o analfabetismo"
And I fill the field "Message" with the text "Obrigado"
And I select "Create Email"
Then I can see a successful message
And I can see the message with subject "Obrigado por lutar contra o analfabetismo" in the "emails" page.

@f
Scenario: Send message without subject (GUI)
Given I am at the "emails" page
When I select "New Email"
And I fill the field "Subject" in blank ""
And I fill the field "Message" with the text "Obrigado"
And I select "Create Email"
Then I can see an error message.
