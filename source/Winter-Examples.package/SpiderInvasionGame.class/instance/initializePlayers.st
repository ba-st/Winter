initialization
initializePlayers

	| player |

	player := SpiderInvasionPlayer on: self.

	player
		addInteractionOnKeyDownOf: Character arrowLeft
			doing: [ player moveLeft];
		addInteractionOnKeyDownOf: Character arrowRight
			doing: [ player moveRight];
		addInteractionOnKeyDownOf: Character tab  
			doing: [ player fire].
	
	self addPlayer: player