events
checkCollition

	self position x + 80 > 440 | (self position x < 0)
		ifTrue: [ xOffset := xOffset negated ].
	self position y + 80 > 340| (self position y < 0)
		ifTrue: [ yOffset := yOffset negated ]