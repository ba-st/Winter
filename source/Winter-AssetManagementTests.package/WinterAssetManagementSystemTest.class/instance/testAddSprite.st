Tests
testAddSprite

	| system sprite |
	
	system := WinterAssetManagementSystem current.
	sprite := WinterSprite fromRelativePath: 'pharo.png'.
	system addSprite: sprite named: 'pharo'.
	self
		deny: system sprites isEmpty;
		assert: (system spriteNamed: 'pharo') equals: sprite