Initialization
initialize

	super initialize.
	keyDownInteractions := Dictionary new.
		keyUpInteractions := Dictionary new.
	interactionEvents := OrderedCollection new.
	self
		initializeResources;
		initializeCollisionShape;
		initializeInteractions.
		