Feature: Starting the game
	In order to play Battleships
	As a player of the old school
	I want to start a new game

	Scenario: Registering
		Given I am on the homepage
		When I click "New Game"
		Then I should see "What's your name?"
		And I should see a form for "name" input
		And I should see a submit button

	Scenario: Submitting my name
		Given I am on the new game page
		When I submit "Dave" as my name
		Then I should see "Welcome to BattleShips, Dave!"