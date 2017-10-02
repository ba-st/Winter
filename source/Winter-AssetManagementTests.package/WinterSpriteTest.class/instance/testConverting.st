tests
testConverting
	| sprite canvas paint |
	sprite := WinterSprite fromRelativePath: 'pharo.png'.
	canvas := (AthensCairoSurface extent: 100 @ 50) newCanvas.
	paint := sprite asAthensPaintOn: canvas.
	self
		assert: (paint isKindOf: AthensCairoPatternPaint);
		assert: paint isSuccess;
		assert: paint extent equals: sprite extent