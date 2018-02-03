tests
testAccessing

	| texture textureRegion tile |

	texture := WinterTexture from: 'pharo.png' asFileReference.
	textureRegion := WinterTextureRegion of: texture.
	tile := WinterTiledMapTile of: textureRegion havingOffsetX: 2.0 andOffsetY: 2.0.

	self
		assert: tile textureRegion equals: textureRegion;
		assert: tile offSetX equals: 2.0;
		assert: tile offSetY equals: 2.0;
		assert: tile mapObjects isEmpty;
		assert: tile mapProperties isEmpty.
		
	tile textureRegion: nil;
		offSetX: 1.0;
		offSetY: 1.0;
		mapObjects: (Array with: 1);
		mapProperties: (Array with: 1).
		
	self
		assert: tile textureRegion isNil;
		assert: tile offSetX equals: 1.0;
		assert: tile offSetY equals: 1.0;
		assert: tile mapObjects notEmpty ;
		assert: tile mapProperties notEmpty.