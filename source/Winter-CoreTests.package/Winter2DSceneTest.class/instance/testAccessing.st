tests
testAccessing
	| scene game |
	scene := Winter2DSceneNoPhysics new.
	game := WinterBallExampleNoPhysics new.
	self
		assert: scene backgroundColor equals: Color white.
	
	scene backgroundColor: Color orange.
	scene game: game.
	self
		assert: scene backgroundColor equals: Color orange;
		assert: scene dimensions equals: game dimensions;
		assert: scene surface extent equals: scene dimensions