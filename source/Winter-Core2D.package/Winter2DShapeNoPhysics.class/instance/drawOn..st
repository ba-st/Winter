Drawing
drawOn: aCanvas
	aCanvas pathTransform
		restoreAfter: [ aCanvas pathTransform translateBy: self position.
			self setSpecificPaintOn: aCanvas .
			self drawSpriteOrShapeOn: aCanvas ]