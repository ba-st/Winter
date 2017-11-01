Initialization
initializeOn: aPoint ofExtent: anotherPoint inState: aBlockState

	collisionShape := Winter2DSquare
		ofCenter: aPoint
		extent: anotherPoint
		color: aBlockState color
		in: game.
	colorState := aBlockState