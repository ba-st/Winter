Tests
testAccessing

	| texture |

	texture := WinterTexture from: 'pharo.png' asFileReference.
	
	self
		assert: texture width equals: 512;
		assert: texture height equals: 512
	