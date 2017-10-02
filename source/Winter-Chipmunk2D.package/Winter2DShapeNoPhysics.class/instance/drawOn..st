Drawing
drawOn: aCanvas
	aCanvas pathTransform
		restoreAfter: [ aCanvas pathTransform translateBy: self position.
			self drawSpriteOrShapeOn: aCanvas  ]