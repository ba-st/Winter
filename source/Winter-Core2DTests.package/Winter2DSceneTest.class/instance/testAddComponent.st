Tests
testAddComponent
	
	| scene game component |
	
	game := self game.
	scene := game scene.
	component := self component.
	
	self assert: scene components isEmpty.
	
	scene addComponent: component.
	
	self
		assert: scene components notEmpty;
		assert: scene components size equals: 1;
		assert: scene components first equals: component