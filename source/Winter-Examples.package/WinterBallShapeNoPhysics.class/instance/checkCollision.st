Collision
checkCollision
	(CollisionAgainstMapBordersChecker for: self)
		value: #x;
		value: #y.
	game currentScene players
		do: [ :each | (CollisionChecker for: self and: each colliderShape) value ].
	game currentScene components do: [ :each | (CollisionChecker for: self and: each) value ]