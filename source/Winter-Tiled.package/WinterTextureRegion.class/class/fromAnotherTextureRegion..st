Instance Creation
fromAnotherTextureRegion: aTextureRegion

	^ (self of: aTextureRegion texture)
		setRegionUsingU: aTextureRegion u
		v: aTextureRegion v
		u2: aTextureRegion u2
		v2: aTextureRegion v2