rendering
render

	surface drawDuring: [ :canvas |
		model renderOn: canvas ].
	self window handle handle updateWindowSurface