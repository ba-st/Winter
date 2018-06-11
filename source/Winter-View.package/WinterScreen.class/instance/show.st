rendering
show

	self extent: model dimensions .
	self eventHandler: (model eventHandlerFor: self).
	scheduler startProcess 