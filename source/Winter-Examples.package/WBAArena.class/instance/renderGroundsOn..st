rendering
renderGroundsOn: canvas
	| arenaSize |
	arenaSize := cells size + 1 @ (cells first size + 1) * self cellSize.
	groundPaint ifNil: [ self initGroundPaint: arenaSize ].
	canvas setShape: (0@0 fastCorner: arenaSize).
	canvas setPaint: groundPaint.
	canvas draw.