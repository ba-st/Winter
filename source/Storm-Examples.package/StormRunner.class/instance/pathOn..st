drawing
pathOn: aCanvas
	^graphicsPath ifNil: [
		graphicsPath  := aCanvas createPath: [ :builder |
			builder 
				relative;
				lineTo: self extent x@0;
				lineTo: 0@self extent y;
				lineTo: self extent x negated@0;
				lineTo: 0@self extent y negated ] ]