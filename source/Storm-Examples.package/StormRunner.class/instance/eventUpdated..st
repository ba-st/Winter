events
eventUpdated: anEvent
	self position: self physicBody position - self gravityCenter.
	self drawOn: anEvent canvas.