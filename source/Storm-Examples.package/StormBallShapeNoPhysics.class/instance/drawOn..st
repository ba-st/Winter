events
drawOn: aCanvas
	aCanvas pathTransform
		restoreAfter: [ aCanvas pathTransform translateBy: self position.
			aCanvas setPaint: (self paintOn: aCanvas).
			aCanvas
				drawShape:
					(CircleMorph new
						extent: 80@80;
						color: Color orange;
						position: self position ;
						yourself) ]