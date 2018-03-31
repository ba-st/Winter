Tests
testAddComponents
	
	| scene game component anotherComponent|
	
	game := self game.
	scene := game scene.
	component := self component.
	anotherComponent := self component .
	
	self assert: scene components isEmpty.
	
	scene addComponents: (Array with: component with: anotherComponent ).
	
	self
		assert: scene components notEmpty;
		assert: scene components size equals: 2;
		assert: (scene components includes: component) ;
		assert: (scene components includes: anotherComponent) 