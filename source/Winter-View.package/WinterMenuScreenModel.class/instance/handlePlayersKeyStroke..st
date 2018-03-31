event handling
handlePlayersKeyStroke: code	
	
	startingGame players withIndexDo: [ :player :playerIndex |
		| index |
		((index := player keyboardCodes indexOf: code) between: 1 and: 4)
			ifTrue: [ self handleKeyStrokeFor: playerIndex key: index ] ]