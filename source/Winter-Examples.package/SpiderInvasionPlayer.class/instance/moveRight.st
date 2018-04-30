Moving
moveRight

	| newX |
	self flag: 'Revisar el min'.
	newX := (self positionX + 24 )  min: 336.
	collisionShape position: newX @ self positionY