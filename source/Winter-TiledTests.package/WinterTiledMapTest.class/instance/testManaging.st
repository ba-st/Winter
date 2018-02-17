tests
testManaging
	
	| map |
	
	map := WinterTiledMap new.
	
	self
		assert: map layers isEmpty;
		assert: map properties isEmpty;
		assert: map tileSets isEmpty;
		assert: map resources isEmpty;
		assert: (map tilesAt: 1) isNil.
	
	map addLayer: self layer.
	map propertiesAt: #property put: self property.
	map addTileSet: self tileSet.
	
	self
		deny: map layers isEmpty;
		assert: (map layers includes: self layer);
		deny: map properties isEmpty;
		assert: (map propertiesAt: #property) equals: self property;
		deny: map tileSets isEmpty;
		assert: (map tileSets includes: self tileSet);
		assert: (map tilesAt: 1) equals: self tile.
	
