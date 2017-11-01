Movement
moveRight

	| newX |
	
	newX := (self position + (10 @ 0)) x min: 626.
	collisionShape position: newX @ self positionY