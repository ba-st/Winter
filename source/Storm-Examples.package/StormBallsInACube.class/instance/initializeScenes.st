initialization
initializeScenes
	self addScene: (Storm2DScene new
		backgroundColor: Color black;
		addComponents: self createWallShapes;
		addComponent: (generator := self createBallGenerator);
		yourself)