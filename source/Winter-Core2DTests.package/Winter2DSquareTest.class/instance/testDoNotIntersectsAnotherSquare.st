Tests
testDoNotIntersectsAnotherSquare

	| game  square anotherSquare|

	game := self game.
	square := Winter2DSquare
		ofCenter: 200 @ 560
		extent: 20 @ 5
		color: Color red
		in: game.
	anotherSquare := Winter2DSquare
		ofCenter: 150 @ 500
		extent: 20 @ 5
		color: Color red
		in: game.	
			
	self deny: (square intersects: anotherSquare )