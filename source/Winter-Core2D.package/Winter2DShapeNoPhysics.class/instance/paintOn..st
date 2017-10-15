Drawing
paintOn: aCanvas
	^ graphicsPaint ifNil:
		[ self createPaintOn: aCanvas ]