Feature: AI Chatbot
  As a fashion content creator 
  I want to set up a nice portfolio profile for NXTFolio 

  Scenario: I can access the ai chatbot page
    Given I am a content creator and I want to learn how to set up fashion portfolio
    And I want to go to the ai chatbot page
    When I enter "Hi" message and click send
    Then I should see assistant's reply
  



