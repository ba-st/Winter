Drawing
renderOn: aCanvas
	aCanvas pathTransform
		restoreAfter: [ aCanvas pathTransform translateBy: self position.
			self setSpecificPaint: (self paintOn: aCanvas) on: aCanvas.
			self renderShape: (self pathOn: aCanvas) on: aCanvas ]