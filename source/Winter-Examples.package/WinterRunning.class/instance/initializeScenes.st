initialization
initializeScenes
	self addScene: (Winter2DScene new
		backgroundColor: Color black;
		addComponent: self createFloor;
		addComponent: (self createRunner
			position: 150@50;
			yourself);
		yourself)