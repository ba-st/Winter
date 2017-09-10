Accessing
wallShapes
	^ {(320 negated @ 240 negated extent: 320 negated @ 240).
	(320 @ 240 negated extent: 320 @ 240).
	(320 @ 240 negated extent: 320 negated @ 240 negated)}
	collect: [ :each |
		StormTinyWallShape new 
			color: Color black;
			bounds: each;
			yourself ]