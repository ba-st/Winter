initialization
initializeFor: aStormComponent onCollisionDo: aBlock
	component := aStormComponent.
	gameWindow :=component game window.
	collisionAction := aBlock