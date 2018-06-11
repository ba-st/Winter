Tests
testRemovePlayer
	
	| scene game player |
	
	game := self game.
	scene := game scene.
	player := self player.
	
	self assert: scene players isEmpty.
	
	scene addPlayer: player.
	
	self
		assert: scene players notEmpty;
		assert: scene players size equals: 1;
		assert: scene players first equals: player.
	
	scene removePlayer: player.
	
	self assert: scene players isEmpty