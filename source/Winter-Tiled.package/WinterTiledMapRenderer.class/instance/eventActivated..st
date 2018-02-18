Events
eventActivated: anEvent

	anEvent additionalInfoAt: #unitScale put: unitScale.
	map layers do: [ :layer | layer eventActivated: anEvent ]