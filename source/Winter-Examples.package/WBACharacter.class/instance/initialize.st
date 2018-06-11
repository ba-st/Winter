initialization
initialize

	super initialize.

	self shift: self initialShift.
	direction := 1.
	isMoving := false.
	currentFoot := 0.