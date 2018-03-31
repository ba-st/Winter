Initialization
initializePlayers

	| player |

	player := ArkanoidPlayer on: self.
	"player
		addInteractionOf: Character arrowLeft asShortcut
			doing: [ player moveLeft.
			playing := true ];
		addInteractionOf: Character arrowRight asShortcut
			doing: [ player moveRight.
			playing := true ]."
	self addPlayer: player