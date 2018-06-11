rendering
renderOn: canvas
	canvas pathTransform translateBy: shift.
	canvas setPaint: self spriteToRender.
	canvas draw.
	canvas pathTransform translateBy: negatedShift. 