private
initializeScenes
	self
		addScene:
			(Storm2DScene new
				backgroundColor: Color black;
				addComponent:
					(self createBallShape
						position: 10 @ 50 negated;
						yourself))