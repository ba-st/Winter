actions
handleKeyStrokeFor: playerIndex key: index
	| currentLocation newLocation |
	currentLocation := currentChoices at: playerIndex.
	newLocation := (currentLocation + (index * 2 - 5)) \\ 6.
	newLocation < 0 ifTrue: [ newLocation := 5 ].
	currentChoices at: playerIndex put: newLocation.