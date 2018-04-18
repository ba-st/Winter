initialization
initialize

	super initialize.
	keyDownInteractions := Dictionary new.
	keyUpInteractions := Dictionary new.
	self
		initializeResources;
		initializeCollisionShape
		