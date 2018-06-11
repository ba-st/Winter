rendering
initGroundPaint: arenaSize
	| surf |
	surf := AthensCairoSurface extent: arenaSize.
	surf drawDuring: [ :can |
		can setShape: (0@0 corner: self cellSize).
		self 	
			renderCells: [ :cell |
				can setPaint: cell ground.
				can draw ] 
			on: can ].
	groundPaint := AthensCairoPatternSurfacePaint createForSurface: surf
		