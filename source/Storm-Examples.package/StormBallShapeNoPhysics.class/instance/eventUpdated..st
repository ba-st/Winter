Events
eventUpdated: anEvent

	self position: self  position + self offset.
	self drawOn: anEvent canvas.
	self checkCollition.