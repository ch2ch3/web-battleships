Feature: placing ships on the board
	As a player of the game BattleShips
	In order to start playing the game
	I want to be able to place my ships

	Scenario: navigating to ship placement page
		Given I've started a game with the players "Dave" and "Ethel"
		When I click on the "start placing ships" button
		Then I should be on the ship placement page
		
	Scenario: seeing the grid
		Given I am on the ship placement page
		Then I should see a grid for placing a ships on
		And it is a 10x10 grid

