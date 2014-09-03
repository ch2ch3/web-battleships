Feature: Starting the game
	In order to play Battleships
	As a player of the old school
	I want to start a new game

	Scenario: Obtaining name
		Given I am on the homepage
		When I click "New Game"
		Then I should see "What's your name?"
    And somewhere I can write my name
    And a button that I can click    
