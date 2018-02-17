Tests
testCreationFromAnotherTextureRegion

	| texture textureRegion newTextureRegion|

	texture := WinterTexture from: 'pharo.png' asFileReference.
	textureRegion := WinterTextureRegion of: texture.
	newTextureRegion := WinterTextureRegion fromAnotherTextureRegion: textureRegion .

	self
		assert: newTextureRegion texture equals: textureRegion texture;
		assert: newTextureRegion regionHeight equals: textureRegion regionHeight;
		assert: newTextureRegion regionWidth equals: textureRegion regionWidth;
		assert: newTextureRegion u equals: textureRegion u;
		assert: newTextureRegion u2 equals: textureRegion u2;
		assert: newTextureRegion v equals: textureRegion v;
		assert: newTextureRegion v2 equals: textureRegion v2;
		assert: newTextureRegion regionX equals: textureRegion regionX;
		assert: newTextureRegion regionY equals: textureRegion regionY.
	