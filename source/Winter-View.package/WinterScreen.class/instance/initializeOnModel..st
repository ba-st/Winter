initialization
initializeOnModel: aModel

	self extent: aModel extent.
	self eventHandler: (aModel eventHandlerFor: self).
	aModel loadWidgets.
	aModel startAnimation.
	self model: aModel