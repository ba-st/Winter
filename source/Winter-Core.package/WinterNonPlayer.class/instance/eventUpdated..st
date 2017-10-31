Events
eventUpdated: anEvent

	self updateCollisionShapeUsing: anEvent  .
	self checkCollisions.
	self drawOn: anEvent canvas.