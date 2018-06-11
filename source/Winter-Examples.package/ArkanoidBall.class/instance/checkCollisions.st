Collisions
checkCollisions

	(CollisionChecker for: self and: scene player) value.
	scene components
		do: [ :component | 
			component = self
				ifFalse: [ (CollisionChecker for: self and: component) value ] ].
	self checkEnfGame