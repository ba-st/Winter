Initialization
initializaBounds: aRectangle ofColor: aColor
	self bounds: aRectangle.
	color := aColor.
	walls := {(position x @ (position y - extent x) extent: extent transposed).
	(position extent: extent).
	((position + extent) x @ (position y - extent x) extent: extent transposed)}
		collect: [ :each | 
			WinterTinyWallShapeNoPhysics new
				color: color;
				bounds: each;
				yourself ]