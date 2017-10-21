Initialization
initializeInteraction
	self
		addInteractionOf: Character arrowLeft asShortcut
		doing: [ colliderShape  position: colliderShape position - (8 @ 0) ].
		self
		addInteractionOf: Character arrowRight  asShortcut
		doing: [ colliderShape position: colliderShape position + (8 @ 0)]