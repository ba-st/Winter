initialization
initializeCollisionShape

	collisionShape := Winter2DSquare
		ofCenter: (384 "game dimensions x" / 2) @ 672 "game dimensions y" - (48@48)
		extent: 48@48 "game spriteSize"
		color: Color red
		in: game