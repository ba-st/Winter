initialization
createWallShapes
	^{
		{  0 @ 360. 150 @ 340. 0 @ 300. }.
		{ self dimensions x - 150 @ 460.
		  self dimensions x @ 460.
		  self dimensions x @ 420. }.
		{ 50 @ 580. 50 @ 615. 150 @ 615. }.
		{ 150 @ 600. 225 @ 610. 225 @ 585. }. 
	} collect: [ :each | StormPolygonWallShape vertices: each ]