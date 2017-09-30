Drawing
drawSpriteOrShapeOn: aCanvas
	aCanvas setPaint: (self paintOn: aCanvas).
	sprite
		ifNil: [ aCanvas
				drawShape:
					(CircleMorph new
						extent: 200 @ 200;
						color: Color orange;
						position: self position;
						yourself) ]
		ifNotNil: [ aCanvas draw: sprite ]