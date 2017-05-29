Feature: Broadcast
As A system administrator
I WANT TO send message, notifications and updates to system users and the public
SO THAT I can keep the donors and the public updated with the organization actions and projects

Scenario: Send email about notifications
Given I have an article "Ampliando limites" registered in the system
When the article "Ampliando Limites" isn’t marked as sent
Then an email is sent to the donors with title "Ampliando limites"
And the article "Ampliando limites" is marked as sent.

Scenario: Send duplicate email about notifications
Given I have an article "Ampliando limites" registered in the system
When the article "Ampliando Limites" is marked as sent
Then the system will not send the email.

Scenario: Send message
Given I wrote a message with title "Obrigado por lutar contra o analfabetismo"
And there is no other message with the title "Obrigado por lutar contra o analfabetismo"  in the system
When I try to register the message "Obrigado por lutar contra o analfabetismo"
Then an email is sent to the donors with title "Obrigado por lutar contra o analfabetismo"
And the message "Obrigado por lutar contra o analfabetismo" is registered on the system
And the message "Obrigado por lutar contra o analfabetismo" is marked as sent.

Scenario: Send duplicate message
Given I have a message with the title "Obrigado por lutar contra o analfabetismo" registered in the system
And I wrote a message with the title "Obrigado por lutar contra o analfabetismo"
When I try to register the message "Obrigado por lutar contra o analfabetismo"
Then the system will not send the email.


Scenario: Send message (GUI)
Given I am at the "broadcast" page
When I select "new message"
And I fill the field "subject" with "Obrigado por lutar contra o analfabetismo"
And I fill the field "message" with the text "Obrigado"
Then I can see a successful message
And I can see the message with title "Obrigado por lutar contra o analfabetismo" at the "messages sent" area in the "broadcast" page.


Scenario: Send duplicate message (GUI)
Given I am at the "broadcast" page
And there is a message with title "Obrigado por lutar contra o analfabetismo"  at the "messages sent" area
When I select "new message"
And I fill the field "title" with "Obrigado por lutar contra o analfabetismo"
And I fill the field "message" with "Obrigado"
And I select "send message"
Then I can see an error message.

Scenario: Send message without title (GUI)
Given I am at the "broadcast" page
When I select "new email"
And I fill the field "title" without title ""
And I fill the field "message" with the text "Obrigado"
Then I can see an error message.
