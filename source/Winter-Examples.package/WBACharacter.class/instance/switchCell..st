animations
switchCell: shiftIncr
	| newCell |
	newCell := cell neighbours at: direction.
	newCell element allowMovement ifTrue: [ 
		cell element: WBAEmpty empty.
		cell := newCell.
		cell element: self.
		cell spells 
			detect: [ :sp | sp character ~= self ] 
			ifFound: [ :elem | elem nextAnimation ].
		self shift: self initialShift - (self numberOfAnimationFrame / 2 * shiftIncr negated).
		^ shiftIncr ].
	"newCell is full, move back"
	^ shiftIncr negated