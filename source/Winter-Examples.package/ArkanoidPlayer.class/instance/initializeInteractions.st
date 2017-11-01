Initialization
initializeInteractions
	self
		addInteractionOf: Character arrowLeft asShortcut
		doing: [ self moveLeft.
			self startGame ].
	self
		addInteractionOf: Character arrowRight asShortcut
		doing: [ self moveRight.
			self startGame ]