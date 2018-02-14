Tests
testFlipping
	
	| texture textureRegion |
	
	texture := WinterTexture from: 'pharo.png' asFileReference.
	textureRegion := WinterTextureRegion of: texture.
	
	self
		deny: textureRegion isFlippedX;
		deny: textureRegion isFlippedY.
	
	self
		assert: textureRegion u equals: 0.0;
		assert: textureRegion u2 equals: 1.0;
		assert: textureRegion v equals: 0.0;
		assert: textureRegion v2 equals: 1.0.
	
	textureRegion
		flipX: true;
		flipY: true.
	
	self
		assert: textureRegion isFlippedX;
		assert: textureRegion isFlippedY.
		
	self
		assert: textureRegion u equals: 1.0;
		assert: textureRegion u2 equals: 0.0;
		assert: textureRegion v equals: 1.0;
		assert: textureRegion v2 equals: 0.0