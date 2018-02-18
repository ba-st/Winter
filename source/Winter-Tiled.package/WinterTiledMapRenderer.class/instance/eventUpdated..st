Events
eventUpdated: anEvent

	anEvent additionalInfoAt: #unitScale put: unitScale.
	map layers do: [ :layer | layer eventUpdated: anEvent ]