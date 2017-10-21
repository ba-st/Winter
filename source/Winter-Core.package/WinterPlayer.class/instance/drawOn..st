Drawing
drawOn: aCanvas
	sprite
		ifNil: [  colliderShape drawOn: aCanvas ]
		ifNotNil: [ self drawSpriteOn: aCanvas ]