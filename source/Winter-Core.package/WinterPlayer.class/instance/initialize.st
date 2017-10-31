Initialization
initialize

	super initialize.
	interactionEvents := OrderedCollection new.
	self
		initializeResources;
		initializeCollisionShape;
		initializeInteractions