Drawing
createPaintOn: aCanvas
	^ graphicsPaint := sprite
		ifNil: [ self color asAthensPaintOn: aCanvas ]
		ifNotNil: [ sprite asAthensPaintOn: aCanvas ]