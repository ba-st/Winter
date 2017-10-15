Drawing
createPathOn: aCanvas
	^ graphicsPath := aCanvas
		createPath: [ :builder | 
			builder
				absolute;
				moveTo: vertices first.
			vertices allButFirstDo: [ :each | builder lineTo: each ].
			builder close ]