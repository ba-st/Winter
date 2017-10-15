Initialization
initializeInteraction
	self
		addInteractionOf: Character arrowLeft asShortcut
		doing: [ containerBox position: containerBox position - (8 @ 0) ].
		self
		addInteractionOf: Character arrowRight  asShortcut
		doing: [ containerBox position: containerBox position + (8 @ 0)]