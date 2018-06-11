rendering
display

	screen extent: self dimensions .
	screen eventHandler: self eventHandler.
	self loadWidgets.
	self startAnimation.
	screen model: self.
	screen show