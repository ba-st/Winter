rendering
renderCells: aBlock on: canvas 
	| cellX cellY |
	cellX := self cellSize x.
	cellY := self cellSize y.
	cells do: [ :column |
		canvas pathTransform translateX: cellX Y: 0. 
		1 to: column size do: [ :i | "#to:do: here for performance, cf profiler"
			canvas pathTransform translateX: 0 Y: cellY. 
			aBlock value: (column at: i) ].
		canvas pathTransform translateX: 0 Y: cellY * column size negated  ].
	canvas pathTransform translateX: cellX * cells size negated Y: 0. 