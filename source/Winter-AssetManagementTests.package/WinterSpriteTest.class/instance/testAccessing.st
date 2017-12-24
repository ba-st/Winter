Tests
testAccessing
	| spriteOfRelativePath |
	spriteOfRelativePath := WinterSprite fromRelativePath: 'pharo.png'.
	self
		assert: spriteOfRelativePath width equals: 512;
		assert: spriteOfRelativePath height equals: 512;
		assert: spriteOfRelativePath depth equals: 32;
		assert: spriteOfRelativePath path
			equals: self imageDirectory,'/pharo.png'