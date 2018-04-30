initialization
initializeOn: aGame

	game := aGame.
	collisionShape game: game.
	sprite := self spaceShipSprite .
	loaded := true