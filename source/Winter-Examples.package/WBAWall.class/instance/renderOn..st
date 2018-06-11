rendering
renderOn: canvas
	canvas pathTransform translateBy: shift.
	canvas setPaint: sprite.
	canvas draw.
	canvas pathTransform translateBy: negatedShift.