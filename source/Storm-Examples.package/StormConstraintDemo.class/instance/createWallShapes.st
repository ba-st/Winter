initialization
createWallShapes
	^{
	0@300 extent: 150@40. 
	self dimensions x@420 extent: -150@40.
	50@600 extent: 100@15.
	225@590 extent: -75@25 
	} collect: [ :each |
		StormBoldWallShape new 
			color: Color white;
			bounds: each;
			yourself ]