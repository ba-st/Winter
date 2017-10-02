Drawing
pathOn: aCanvas
	^ sprite
		ifNil: [ graphicsPath ifNil:
				[ self createPathOn: aCanvas ] ]