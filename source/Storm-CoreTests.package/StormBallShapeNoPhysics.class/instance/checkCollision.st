Collision
checkCollision
	(CollisionWithXBorderChecker
		for: self
		onCollisionDo: [ self playCollisionSound.
			self negateX ]) value.
	(CollisionWithYBorderChecker
		for: self
		onCollisionDo: [ self playCollisionSound.
			self negateY ]) value