tests
testAccessing
	
	| tileset |
	
	tileset := WinterTiledMapTileSet named: 'tileset'.
	
	self
		assert: tileset name equals: 'tileset';
		assert: tileset properties isEmpty;
		assert: tileset tilesCount isZero .
	
	tileset name: 'anotherName'.
	
	self assert: tileset name equals: 'anotherName'