Accessing
game: aGame
	game := aGame.
	components do: [ :each | each game: aGame ]