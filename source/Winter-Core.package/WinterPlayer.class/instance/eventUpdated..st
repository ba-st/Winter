Events
eventUpdated: anEvent

	collisionShape eventUpdated: anEvent .
	self checkCollisions.
	self renderOn: anEvent canvas.
