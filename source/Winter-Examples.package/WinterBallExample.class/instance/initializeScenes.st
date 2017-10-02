private
initializeScenes
	self
		addScene:
			(Winter2DScene new
				backgroundColor: Color black;
				addComponent:
					(self createBallShape
						position: 10 @ 50 negated;
						yourself);
				yourself)