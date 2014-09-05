Feature: Player One starting a game
  As a new player
  I want to start battleships
  I love battleships

  Scenario: Visiting the homepage
    When I go to the battleships webpage 
    Then I should see "Please enter your name"
    And a submit button
