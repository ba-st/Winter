Initialization
initializeOn: aPoint ofExtent: anotherPoint inState: aBlockState

	collisionShape position: aPoint ; extent: anotherPoint; color: aBlockState color .
	colorState := aBlockState 