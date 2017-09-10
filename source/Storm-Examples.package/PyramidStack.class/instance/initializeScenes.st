Accessing
initializeScenes
	self
		addScene:
			(PyramidStackScene  new
				backgroundColor: Color black;
				addComponents: self wallShapes;
				yourself)