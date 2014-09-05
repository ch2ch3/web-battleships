Feature: Starting the game
	In order to play Battleships
	As a player of the old school
	I want to start a new game

	Scenario: Obtaining name
		Given I am on the homepage
		When I click "New Game"
		Then I should see "Player One, what's your name?"
		And I should see a form for adding a player
		And I should see a submit button

	Scenario: Submitting my name
		Given I am on the new game page
		When I submit "Dave" as my name
		Then I should see "Welcome to BattleShips, Dave!"

	Scenario: Not submitting my name
		Given I am starting a brand new game
		And I am the only player so far
		When I submit my name without typing anything in
		Then I should see "Welcome to BattleShips, Player One!"

  Scenario: Adding a second player
		Given Dave has already added himself as a player
		When I submit "Ethel" as my name
		Then I should see "Welcome to BattleShips, Dave and Ethel!"
		And a button that says "start placing ships"
