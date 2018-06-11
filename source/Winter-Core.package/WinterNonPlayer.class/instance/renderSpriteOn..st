Rendering
renderSpriteOn: aCanvas

	aCanvas pathTransform
		restoreAfter: [ aCanvas pathTransform translateBy: self translation.
			aCanvas setPaint: (sprite asAthensPaintOn: aCanvas).
			sprite drawOnAthensCanvas: aCanvas ]