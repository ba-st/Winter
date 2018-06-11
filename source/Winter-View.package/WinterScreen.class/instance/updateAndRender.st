rendering
updateAndRender

	surface drawDuring: [ :canvas |
		model updateUsing: canvas.
		model renderOn: canvas ].
	self window handle handle updateWindowSurface