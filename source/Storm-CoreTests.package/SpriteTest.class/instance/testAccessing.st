tests
testAccessing

	| spriteOfAbsolutePath spriteOfRelativePath|
	spriteOfAbsolutePath := StormSprite fromAbsolutePath: 'home/alvaro/Escritorio/pharo-trans.png'.
	spriteOfRelativePath := StormSprite fromRelativePath: 'pharo-trans.png'.
	self
		assert: spriteOfAbsolutePath width equals: 259;
		assert: spriteOfAbsolutePath height equals: 194;
		assert: spriteOfAbsolutePath depth equals: 32;
		assert: spriteOfAbsolutePath path equals: '/home/alvaro/Escritorio/pharo-trans.png'.
		
	self
		assert: spriteOfRelativePath width equals: 259;
		assert: spriteOfRelativePath height equals: 194;
		assert: spriteOfRelativePath depth equals: 32;
		assert: spriteOfRelativePath path equals: '/home/alvaro/Escritorio/pharo6.1/shared/pharo-trans.png'