drawing
drawWithSurface:  aSurface
	drawBlock ifNotNil: [ 
		aSurface drawDuring: [ :canvas | 
			canvas pathTransform loadIdentity.
			drawBlock value: canvas ] ].
	
	self container image: aSurface asForm