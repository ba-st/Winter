Movement
moveLeft

	| newX |

	newX := (self position + (10 @ 0) negated) x max: 0.
	collisionShape position: newX @ self positionY