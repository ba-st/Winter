Tests
testAccessing

	| game circle |

	game := WinterTestGame new.
	circle := Winter2DSquare
		ofCenter: 200 @ 560
		extent: 200 @ 0
		color: Color red
		in: game.
	
	self
		assert: circle extent equals: 200 @ 0;
		assert: circle position equals: 200 @ 560;
		assert: circle bounds equals: (circle position extent: circle extent);
		assert: circle color equals: Color red;
		assert: circle game equals: game