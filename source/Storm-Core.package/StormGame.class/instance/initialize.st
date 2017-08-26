initialization
initialize
	super initialize.
	engine := StormEngine game: self.
	players := Set new.
	scenes := OrderedCollection new.
	
	self initializeWalker.
	self initializeResources.
	self initializeScenes.
	
	self currentScene: self scenes first.