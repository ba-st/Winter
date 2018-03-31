Events
eventUpdated: anEvent

	self updateCollisionShapeUsing: anEvent  .
	self checkCollisions.
	"self renderOn: anEvent canvas."