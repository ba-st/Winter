initialization
initialize
	super initialize.
	engine := WinterEngine game: self.
	players := Set new.
	scenes := OrderedCollection new.
	collisionHandlers := OrderedCollection new.
	self initializeCollisionHandler.
	self initializeWalker.
	self initializeResources.
	self initializeScenes.
	
	self currentScene: self scenes first.
	self initializePlayers.