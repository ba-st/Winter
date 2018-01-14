Tests
testIntersectsAnotherSquare

	| game  square anotherSquare|

	game := WinterTestGame new.
	square := Winter2DSquare
		ofCenter: 200 @ 560
		extent: 20 @ 5
		color: Color red
		in: game.
	anotherSquare := Winter2DSquare
		ofCenter: 200 @ 560
		extent: 20 @ 5
		color: Color red
		in: game.	
			
	self assert: (square intersects: anotherSquare )