drawing
paintOn: aCanvas
	^graphicsPaint ifNil: [ 
		graphicsPaint := self color asAthensPaintOn: aCanvas ]