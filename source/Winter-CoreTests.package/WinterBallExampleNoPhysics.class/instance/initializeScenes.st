Initialization
initializeScenes
	self
		addScene:
			(Winter2DSceneNoPhysics new
				backgroundColor: Color black;
				addComponent:
					(self createBallShape
						position: 0 @ 0;
						yourself);
				addComponents: self createWallShapes;
				yourself)