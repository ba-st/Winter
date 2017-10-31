Initialization
initializeInteractions
	self
		addInteractionOf: Character arrowLeft asShortcut
		doing: [ collisionShape  position: collisionShape position - (8 @ 0) ].
		self
		addInteractionOf: Character arrowRight  asShortcut
		doing: [ collisionShape position: collisionShape position + (8 @ 0)]