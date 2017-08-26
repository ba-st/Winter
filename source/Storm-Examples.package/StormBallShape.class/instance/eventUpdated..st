events
eventUpdated: anEvent
	self position: self physicBody position - self radius.
	self drawOn: anEvent canvas.