initialization
initialize

	super initialize.
	scheduler := WinterGameScheduller managing: self.
	collisionHandlers := OrderedCollection new.
	self initializeCollisionHandlers.
	self initializeResources.
	self initializeScenes.
	self initializePlayers.
	
	