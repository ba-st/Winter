tests
testAccessing
	| spriteOfRelativePath |
	spriteOfRelativePath := StormSprite fromRelativePath: 'pharo.png'.
	self
		assert: spriteOfRelativePath width equals: 392;
		assert: spriteOfRelativePath height equals: 129;
		assert: spriteOfRelativePath depth equals: 8;
		assert: spriteOfRelativePath path
			equals: self imageDirectory,'\pharo.png'