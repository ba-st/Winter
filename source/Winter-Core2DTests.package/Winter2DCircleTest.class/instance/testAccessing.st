Tests
testAccessing

	| game circle |
	
	game := WinterTestGame new.
	circle := Winter2DCircle
		ofCenter: 250 @ 530
		radius: 15
		color: Color red
		in: game.
		
	circle scene: game currentScene .		
	
	self
		assert: circle bounds equals: (250 @ 530 extent: 15 @ 15);
		assert: circle radius equals: 15;
		assert: circle position equals: 250 @ 530;
		assert: circle color equals: Color red;
		assert: circle game equals: game;
		assert: circle scene equals: game currentScene 