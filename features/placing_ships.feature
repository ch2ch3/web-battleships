Feature: placing ships on the board
	As a player of the game BattleShips
	In order to start playing the game
	I want to be able to place my ships

	Scenario: placing a ship
		Given I've started a game with the players "Dave" and "Ethel"
		When I'm on the ship placement screen
		Then I should see a grid for placing a ships on
		And it's made from 100 squares for placing ships on

