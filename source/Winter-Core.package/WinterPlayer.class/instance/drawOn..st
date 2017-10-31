Drawing
drawOn: aCanvas
	sprite
		ifNil: [  collisionShape drawOn: aCanvas ]
		ifNotNil: [ self drawSpriteOn: aCanvas ]