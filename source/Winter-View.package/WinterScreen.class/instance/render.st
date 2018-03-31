rendering
render

	surface drawDuring: [ :canvas |
		model renderOn: canvas ].
	window handle handle updateWindowSurface