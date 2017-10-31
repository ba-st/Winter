Initialization
initializeInteractions

	self addInteractionOf: Character arrowLeft asShortcut doing: [ collisionShape updatePositionBy: (10 @ 0) negated . self startGame].
	self addInteractionOf: Character arrowRight asShortcut doing: [ collisionShape updatePositionBy: 10 @ 0 . self startGame]