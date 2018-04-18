Collisions
checkCollisions

	"(CollisionAgainstMapBordersChecker for: self)
		value: #x;
		value: #y."
	(CollisionChecker for: self and: scene player) value.
	scene components do: [ :component | component = self ifFalse: [(CollisionChecker for: self and: component) value] ].
	
	(self position y
		>
			game screen
				extentY) ifTrue: [ game resetPlayerAndBall: self ]
		