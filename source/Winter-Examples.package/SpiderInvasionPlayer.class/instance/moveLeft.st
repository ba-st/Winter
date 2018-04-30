Moving
moveLeft

	| newX |

	newX := (self positionX - 24)  max: 0.
	collisionShape position: newX @ self positionY