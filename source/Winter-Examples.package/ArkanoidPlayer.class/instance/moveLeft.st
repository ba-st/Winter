Movement
moveLeft

	| newX |

	newX := (self positionX - 10)  max: 0.
	collisionShape position: newX @ self positionY