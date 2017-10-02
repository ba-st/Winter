drawing
drawOn: aCanvas
	(aCanvas setStrokePaint: self color) width: 3.
	aCanvas drawShape: (self pathOn: aCanvas).
