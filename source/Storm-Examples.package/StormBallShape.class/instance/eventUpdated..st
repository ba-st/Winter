events
eventUpdated: anEvent
self halt.
	self position: self physicBody position - self radius.
	self drawOn: anEvent canvas.