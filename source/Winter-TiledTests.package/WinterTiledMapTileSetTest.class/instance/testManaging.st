tests
testManaging

	| tileset tile |

	tileset := WinterTiledMapTileSet named: 'tileset'.
	tile := WinterTiledMapTile new.

	self
		assert: tileset properties isEmpty;
		assert: tileset tilesCount isZero.

	tileset propertiesAt: #align put: 'center'.
	tileset tilesAt: 1 put: tile.

	self
		deny: tileset properties isEmpty;
		deny: tileset tilesCount isZero.

	self
		assert: (tileset propertiesAt: #align) equals: 'center';
		assert: (tileset tilesAt: 1) equals: tile