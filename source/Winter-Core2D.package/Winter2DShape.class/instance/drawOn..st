Drawing
drawOn: aCanvas
	aCanvas pathTransform
		restoreAfter: [ aCanvas pathTransform translateBy: self position.
			self setSpecificPaint: (self paintOn: aCanvas) on: aCanvas.
			self drawShape: (self pathOn: aCanvas) on: aCanvas ]