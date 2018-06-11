initialization
initialize

	super initialize.
	keyDownInteractions := Dictionary new.
	keyUpInteractions := Dictionary new.
	self
		initializeResources;
		initializeSprite;
		initializeCollisionShape
		