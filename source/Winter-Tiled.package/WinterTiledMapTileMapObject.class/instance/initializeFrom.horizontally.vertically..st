initialization
initializeFrom: aTile horizontally: flagFlipHorizontally vertically: flagFlipVertically

	tile := aTile.
	flipHorizontally := flagFlipHorizontally.
	flipVertically := flagFlipVertically.
	textureRegion := WinterTextureRegion fromAnotherTextureRegion: tile textureRegion.
	textureRegion
		flipX: flipHorizontally;
		flipY: flipVertically