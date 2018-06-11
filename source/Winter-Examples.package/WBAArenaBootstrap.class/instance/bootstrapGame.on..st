as yet unclassified
bootstrapGame: startingGame on: screen
	arena := WBAArena new.
	startGame := startingGame.
	screen extent: startingGame gameDescriptor arenaDescriptor windowExtent.
	screen eventHandler: (self eventHandler: screen).
	self loadSprites: startingGame gameDescriptor surface: screen surface.
	self bootstrapArena: startingGame gameDescriptor arenaDescriptor.
	screen model: arena.
	arena screen: screen.