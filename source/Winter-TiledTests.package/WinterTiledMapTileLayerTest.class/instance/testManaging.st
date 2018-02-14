tests
testManaging

	| layer |

	layer := WinterTiledMapTileLayer
		ofWidth: 2
		height: 2
		tileWidth: 1
		tileHeight: 1.

	self
		assert: (layer cellsAtX: 1 andY: 1) isNil;
		assert: (layer cellsAtX: 1 andY: 2) isNil;
		assert: (layer cellsAtX: 2 andY: 1) isNil;
		assert: (layer cellsAtX: 2 andY: 2) isNil.
		
	layer cellsAtX: 1 andY: 1 put: self cell;
		cellsAtX: 1 andY: 2 put: self cell;
		cellsAtX: 2 andY: 1 put: self cell;
		cellsAtX: 2 andY: 2 put: self cell.
		
	self
		assert: (layer cellsAtX: 1 andY: 1) equals: self cell;
		assert: (layer cellsAtX: 1 andY: 2) equals: self cell;
		assert: (layer cellsAtX: 2 andY: 1) equals: self cell;
		assert: (layer cellsAtX: 2 andY: 2) equals: self cell.
		