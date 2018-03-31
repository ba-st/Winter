Tests
testAccessing

	| scene game |

	game := self game.
	scene := game scene.
	
	self assert: scene backgroundColor equals: Color white.
	scene backgroundColor: Color orange.
	
	scene game: nil.
	self assert: scene game isNil.
	scene game: game.
	
	self
		assert: scene backgroundColor equals: Color orange;
		assert: scene game equals: game;
		assert: scene dimensions equals: game dimensions;
		assert: scene surface notNil;
		assert: scene surface extent equals: scene dimensions;
		assert: scene players isEmpty;
		assert: scene eventQueue  notNil