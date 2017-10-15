Initialization
initialize
	position := 0 @ 0.
	interactionEvents := OrderedCollection new.
	self initializeResources.
	self initializeInteraction