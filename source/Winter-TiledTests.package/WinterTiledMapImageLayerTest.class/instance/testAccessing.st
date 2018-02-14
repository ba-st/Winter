tests
testAccessing

	| layer |

	layer := WinterTiledMapImageLayer of: self textureRegion atX: 5 andAtY: 4.

	self
		assert: layer textureRegion equals: self textureRegion;
		assert: layer x equals: 5;
		assert: layer y equals: 4;
		assert: layer name equals: '';
		assert: layer offsetX  equals: 1.0;
		assert: layer offsetY  equals: 1.0;
		assert: layer opacity   equals: 1.0;
		assert: layer visible;
		assert: layer parent isNil.
		
	layer
		textureRegion: nil;
		x: 4;
		y: 5;
		name: 'layer';
		offsetX: 2.0;
		offsetY: 2.0;
		opacity: 2.0;
		visible: false;
		parent: self.

	self
		deny: layer textureRegion = self textureRegion;
		assert: layer textureRegion isNil;
		assert: layer x equals: 4;
		assert: layer y equals: 5;
		assert: layer name equals: 'layer';
		assert: layer offsetX  equals: 2.0;
		assert: layer offsetY  equals: 2.0;
		assert: layer opacity   equals: 2.0;
		deny: layer visible;
		assert: layer parent equals: self.