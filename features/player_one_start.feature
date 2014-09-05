Feature: Player One starting a game
  As a new player
  I want to start battleships
  I love battleships

  Scenario: Visiting the homepage
    When I go to the battleships webpage 
    Then I should see "Please enter your name"
    And a submit button

  Scenario: Entering my name
  	Given I am on the home page
  	When I enter "Ethel" as my name
  	And I press the submit button
  	Then I should see "Welcome to Battleships, Ethel!"
  	And I should see "Player 1: Ethel"
  	And I should see "Waiting for Player 2..."
