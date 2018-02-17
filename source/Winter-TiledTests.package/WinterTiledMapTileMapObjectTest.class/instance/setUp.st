initialization
setUp

	| texture |
	self createImage.
	texture := WinterTexture from: 'pharo.png' asFileReference.
	textureRegion := WinterTextureRegion of: texture