evaluating
value

	^ (component position y > gameWindow playableExtentY or: [ component position y < gameWindow positionY ])
		ifTrue: collisionAction