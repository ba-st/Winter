rendering
show
	self openWindow.
	self extent: model extent.
	self eventHandler: (model eventHandlerFor: self).
	scheduler startProcess 