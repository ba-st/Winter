tests
testAccessgin

	| layer |

	layer := WinterTiledMapTileLayer
		ofWidth: 2
		height: 2
		tileWidth: 1
		tileHeight: 1.

	self
		assert: layer width equals: 2;
		assert: layer height equals: 2;
		assert: layer tileHeight equals: 1;
		assert: layer tileWidth equals: 1;
		assert: layer name equals: '';
		assert: layer offsetX equals: 1.0;
		assert: layer offsetY equals: 1.0;
		assert: layer opacity equals: 1.0;
		assert: layer visible;
		assert: layer parent isNil.

	layer
		name: 'layer';
		offsetX: 2.0;
		offsetY: 2.0;
		opacity: 2.0;
		visible: false;
		parent: self.

	self
		assert: layer name equals: 'layer';
		assert: layer offsetX equals: 2.0;
		assert: layer offsetY equals: 2.0;
		assert: layer opacity equals: 2.0;
		deny: layer visible;
		assert: layer parent equals: self