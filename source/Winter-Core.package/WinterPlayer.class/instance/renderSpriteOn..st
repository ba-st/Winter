Rendering
renderSpriteOn: aCanvas

	aCanvas pathTransform
		restoreAfter: [ aCanvas pathTransform translateBy: self position.
			aCanvas setPaint: (sprite asAthensPaintOn: aCanvas).
			sprite drawOnAthensCanvas: aCanvas ]