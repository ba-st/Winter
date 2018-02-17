tests
testAccessing
	
	| cell |
	
	cell := WinterTiledMapTileLayerCell
		of: self tile
		flippingHorizontally: true
		flippingVertically: true
		rotating: 2.0.
	
	self
		assert: cell tile equals: self tile;
		assert: cell flipHorizontally;
		assert: cell flipVertically;
		assert: cell rotation equals: 2.0.
		
	cell tile: nil; flipHorizontally: false; flipVertically: false; rotation: 1.0.
	
	self
		assert: cell tile isNil;
		deny: cell flipHorizontally;
		deny: cell flipVertically;
		assert: cell rotation equals: 1.0.