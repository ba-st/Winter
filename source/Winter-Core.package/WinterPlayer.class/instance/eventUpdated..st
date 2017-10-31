Events
eventUpdated: anEvent

	collisionShape eventUpdated: anEvent .
	self checkCollisions.
	self drawOn: anEvent canvas.
