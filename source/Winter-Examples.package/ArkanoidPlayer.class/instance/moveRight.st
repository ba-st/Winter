Movement
moveRight

	| newX |
	
	newX := (self positionX + 10 )  min: 626.
	collisionShape position: newX @ self positionY