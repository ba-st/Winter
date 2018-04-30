Actions
doTick
	currentTick := currentTick - 1.
	currentTick = 0 ifTrue: [ self action. currentTick := tick ].