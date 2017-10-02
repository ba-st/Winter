evaluating
value

	^ (component position x > gameWindow playableExtentX or: [ component position x < gameWindow positionX ])
		ifTrue: collisionAction