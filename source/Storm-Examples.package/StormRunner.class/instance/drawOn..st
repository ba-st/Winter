drawing
drawOn: aCanvas
	aCanvas pathTransform restoreAfter: [
		aCanvas pathTransform 
			translateBy: self position.
		aCanvas setPaint: Color orange.
		aCanvas drawShape: (self pathOn: aCanvas) ]
