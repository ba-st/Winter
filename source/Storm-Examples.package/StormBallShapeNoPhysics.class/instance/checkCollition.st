Collision
checkCollition
	(CollisionWithXBorderChecker
		for: self
		onCollisionDo: [ self negateX.
			self playCollisionSound ]) value.
	(CollisionWithYBorderChecker
		for: self
		onCollisionDo: [ self negateY.
			self playCollisionSound ]) value