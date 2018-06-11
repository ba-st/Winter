initialization
initializeInPosition: aPosition of: aSene

	 scene := aSene.
	game := scene game.
	collisionShape := Winter2DSquare
		ofCenter: aPosition
		extent: self spriteSize 
		color: Color black
		in: self game