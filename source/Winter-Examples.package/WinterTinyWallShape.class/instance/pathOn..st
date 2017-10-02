drawing
pathOn: aCanvas
	^graphicsPath ifNil: [
		graphicsPath  := aCanvas createPath: [ :builder |
			builder 
				relative;
				moveTo: self position;
				lineTo: self extent ] ]