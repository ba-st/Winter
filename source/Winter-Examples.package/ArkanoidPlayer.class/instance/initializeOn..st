Initialization
initializeOn: aGame
	game := aGame.
	collisionShape game: game.
	sprite := self arkanoidBarSprite.