events
eventUpdated: anEvent
	self position: (self position + self delta).
	self adjustPositionToRemainInScreen.
	
	self updateOn: anEvent canvas.