initialization
initializeComponents

	self
		addComponent: ArkanoidBall new;
		addComponent: (ArkanoidWall ofCenter: 0 @ 0 extent: 626 @ 0 andColor: Color white);
		addComponent: (ArkanoidWall ofCenter: 0 @ 0 extent: 0 @ 600 andColor: Color white);
		addComponent: (ArkanoidWall ofCenter: 626 @ 0 extent: 0 @ 600 andColor: Color white)
		