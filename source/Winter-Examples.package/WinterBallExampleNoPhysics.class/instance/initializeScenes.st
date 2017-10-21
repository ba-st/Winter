Initialization
initializeScenes
	self
		addScene:
			(Winter2DSceneNoPhysics new
				backgroundColor: Color black;
				"addComponent:
					(self createBallShape
						position: 0 @ 0;
						yourself);"
					"addComponents: self createWallShapes;"
					"addComponent: (self createContainerOfBoundings:(50@150 extent: 100@0))"
					yourself)