drawing
drawOn: canvas
	canvas pathTransform restoreAfter: [
		canvas pathTransform
			translateBy: self position.
		canvas
			setPaint: self color;
			drawShape: (self pathOn: canvas).
	]
