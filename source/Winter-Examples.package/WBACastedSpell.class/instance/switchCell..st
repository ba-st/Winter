animations
switchCell: shiftIncr
	cell spells remove: self.
	cell := cell neighbours at: direction.
	cell spells add: self.
	self shift: self initialShift - (self numberOfAnimationFrame / 2 * shiftIncr negated).