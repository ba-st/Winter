actions
handleKeyStrokeFor: playerIndex key: index
	| currentLocation newLocation |
	currentLocation := currentChoices at: playerIndex.
	newLocation := currentLocation + ((index \\ 3 - 1) @ (index // 2 - 1)) negated.
	newLocation := (newLocation max: 0@0) min: 12@7.
	(currentChoices anySatisfy: [ :each | each = newLocation ]) ifTrue: [ ^ self ].
	currentChoices at: playerIndex put: newLocation.