rendering
renderOn: canvas	
	self renderBackgroundOn: canvas.
	canvas pathTransform translateBy: shift.
	self renderGroundsOn: canvas.
	canvas setShape: (0@0 fastCorner: 48@64).
	self renderElementsOn: canvas.