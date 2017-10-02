drawing
pathOn: canvas
	^ canvas createPath: [ :builder |
		builder absolute; moveTo: vertices first.
		vertices allButFirstDo: [ :each | builder lineTo: each ].
		builder close.
	]