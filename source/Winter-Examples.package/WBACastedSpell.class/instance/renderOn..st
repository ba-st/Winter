rendering
renderOn: canvas
	canvas pathTransform translateBy: shift.
	canvas setPaint: (sprites at: currentSprite).
	canvas draw.
	canvas pathTransform translateBy: negatedShift.