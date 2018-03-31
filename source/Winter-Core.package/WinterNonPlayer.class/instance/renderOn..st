Drawing
renderOn: aCanvas

	sprite
		ifNil: [  collisionShape  renderOn: aCanvas ]
		ifNotNil: [ self renderSpriteOn: aCanvas ]