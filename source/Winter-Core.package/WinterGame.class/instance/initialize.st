initialization
initialize
	super initialize.
	self initializeSchedulers.
	collisionHandlers := OrderedCollection new.
	self initializeCollisionHandlers.
	self initializeResources.
	self initializeScenes.
	self initializePlayers