Tests
testAddPlayer
	
	| scene game player |
	
	game := WinterTestGame new.
	scene := game currentScene.
	player := self player.
	
	self assert: scene players isEmpty.
	
	scene addPlayer:  player.
	
	self
		assert: scene players notEmpty;
		assert: scene players size equals: 1;
		assert: scene players first equals: player