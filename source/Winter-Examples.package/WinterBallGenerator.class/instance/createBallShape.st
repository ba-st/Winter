private
createBallShape
	^WinterBallShapeNoPhysics  new
		radius: 6 + (9 atRandom);
		color: Color random;
		yourself