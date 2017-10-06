private
createWallShapes
	^{
		50@100 extent: 0@500. 
		50@600 extent: 600@0.
		650@100 extent: 0@500. 
	} collect: [ :each |
		WinterWallShapeNoPhysics new 
			color: Color white;
			bounds: each;
			yourself ]