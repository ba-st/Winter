Tests
testAccessing

	| sprite |
	sprite := WinterSprite fromPath: 'pharo.png' named: 'pharo'.
	self
		assert: sprite name equals: 'pharo';
		assert: sprite width equals: 512;
		assert: sprite height equals: 512;
		assert: sprite path equals: 'pharo.png'