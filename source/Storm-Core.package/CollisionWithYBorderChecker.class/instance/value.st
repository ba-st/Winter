evaluating
value
	| gameWindow |
	gameWindow := component game window.
	^ component position y > gameWindow extent y
		| (component position y < gameWindow position y)
		ifTrue: collisionAction