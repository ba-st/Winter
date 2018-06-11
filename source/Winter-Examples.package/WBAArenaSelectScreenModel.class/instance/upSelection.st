actions
upSelection
	currentChoice := currentChoice - 1.
	currentChoice = 0 ifTrue: [ currentChoice := self numArenas ].