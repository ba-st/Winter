drawing
drawOn: aCanvas
	aCanvas pathTransform restoreAfter: [
		aCanvas pathTransform 
			translateBy: self position.
		aCanvas setPaint: (self paintOn: aCanvas).
		aCanvas drawShape: (self pathOn: aCanvas) ]