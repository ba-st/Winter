tests
testAccessing

	| mapObject |

	mapObject := WinterTiledMapTileMapObject from: self tile horizontally: true vertically: true.

	self
		assert: mapObject x equals: 0;
		assert: mapObject y equals: 0;
		assert: mapObject originX  equals: 0;
		assert: mapObject originY  equals: 0;
		assert: mapObject flipHorizontally ;
		assert: mapObject flipVertically ;
		assert: mapObject rotation  equals: 0;
		assert: mapObject scaleX  equals: 1.0;
		assert: mapObject scaleY  equals: 1.0;
		assert: mapObject name equals: '';
		assert: mapObject opacity equals: 1.0;
		assert: mapObject visible;
		assert: mapObject tile equals: self tile;
		assert: mapObject textureRegion texture equals: self textureRegion texture;
		assert: mapObject color equals: Color white.
		
	mapObject
		x: 5;
		y: 4;
		originX: 5;
		originY:  4;
		scaleX:  5;
		scaleY:  4;
		name: 'tile';
		opacity: 2.0;
		visible: false;
		flipHorizontally: false;
		flipVertically: false;
		rotation: 2.0;
		color: Color black.

	self
		assert: mapObject x equals: 5;
		assert: mapObject y equals: 4;
		assert: mapObject originX  equals: 5;
		assert: mapObject originY  equals: 4;
		deny: mapObject flipHorizontally ;
		deny: mapObject flipVertically ;
		assert: mapObject rotation  equals: 2.0;
		assert: mapObject scaleX  equals: 5;
		assert: mapObject scaleY  equals: 4;
		assert: mapObject name equals: 'tile';
		assert: mapObject opacity equals: 2.0;
		deny: mapObject visible;
		assert: mapObject color equals: Color black