evaluating
value
	| gameWindow |
	gameWindow := component game window.
	^ component position x > gameWindow extent x
		| (component position x < gameWindow position x)
		ifTrue: collisionAction