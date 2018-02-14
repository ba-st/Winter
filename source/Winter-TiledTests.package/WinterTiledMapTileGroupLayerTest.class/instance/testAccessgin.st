tests
testAccessgin

	| layer |

	layer := WinterTiledMapTileGroupLayer new.

	self
		assert: layer layers isEmpty ;
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