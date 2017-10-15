Initialization
createWallShapes
	^{
		50@100 extent: 0@100. 
		50@150 extent: 100@0.
		100@100 extent: 0@100 . 
	} collect: [ :each |
		WinterTinyWallShapeNoPhysics  new 
			color: Color white;
			bounds: each;
			yourself ]