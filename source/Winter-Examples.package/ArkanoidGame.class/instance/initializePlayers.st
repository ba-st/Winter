initialization
initializePlayers

	| player |

	player := ArkanoidPlayer on: self.

	player
		addInteractionOnKeyDownOf: Character arrowLeft
			doing: [ player moveLeft.
			playing := true ];
		addInteractionOnKeyDownOf: Character arrowRight
			doing: [ player moveRight.
			playing := true ].
	
	self addPlayer: player