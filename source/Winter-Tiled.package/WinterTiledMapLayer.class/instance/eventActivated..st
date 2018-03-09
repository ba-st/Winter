Event Handling
eventActivated: anEvent

	unitScale := anEvent additionalInfoAt: #unitScale.
	self drawOn: anEvent canvas