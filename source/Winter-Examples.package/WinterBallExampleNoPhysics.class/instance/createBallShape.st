Initialization
createBallShape
	^ WinterBallShapeNoPhysics  new
		color: Color orange;
		radius: 10;
		sprite: self kirbySprite;
		yourself