Initialization
initializeScenes
	self
		addScene:
			(Storm2DSceneNoPhysics new
				backgroundColor: Color black;
				addComponent:
					(self createBallShape
						position: 0 @ 0;
						yourself))