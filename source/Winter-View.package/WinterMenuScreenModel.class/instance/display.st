rendering
display

	screen extent: self extent.
	screen eventHandler: self eventHandler.
	self loadWidgets.
	self startAnimation.
	screen model: self