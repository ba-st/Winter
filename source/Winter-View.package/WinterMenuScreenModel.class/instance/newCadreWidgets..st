screen building
newCadreWidgets: numPlayers

	| cadreSprites |
	cadreSprites := self loadCadreSprites: numPlayers.
	^ (1 to: numPlayers) collect: [ :i | 
		self newSingleSpriteWidget: (cadreSprites at: i) ].