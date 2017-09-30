drawing
paintOn: aCanvas
	^ graphicsPaint
		ifNil: [ graphicsPaint := sprite
				ifNil: [ self color asAthensPaintOn: aCanvas ]
				ifNotNil: [ sprite asAthensPaintOn: aCanvas ] ]