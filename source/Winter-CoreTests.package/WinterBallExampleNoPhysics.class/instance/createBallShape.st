Initialization
createBallShape
	^ WinterBallShapeNoPhysics  new
		color: Color orange;
		radius: 20;
		sprite: self kirbySprite;
		yourself