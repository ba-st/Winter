Drawing
pathOn: aCanvas

	^ graphicsPath ifNil: [ self createPathOn: aCanvas ]