Drawing
createPathOn: aCanvas
	^graphicsPath  := aCanvas createPath: [ :builder |
			builder 
				relative;
				moveTo: self position;
				lineTo: self extent ]