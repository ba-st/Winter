drawing
drawOn: aCanvas
	(aCanvas setStrokePaint: self color) width: 5.
	aCanvas drawShape: (self pathOn: aCanvas).
