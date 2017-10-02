initialization
initializeScenes
	self addScene: (Winter2DScene new
		backgroundColor: Color black;
		addComponents: self createWallShapes;
		addComponent: (generator := self createBallGenerator);
		yourself)