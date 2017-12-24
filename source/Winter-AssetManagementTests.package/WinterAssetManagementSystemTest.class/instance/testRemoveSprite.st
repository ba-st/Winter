Tests
testRemoveSprite

	| system sprite |
	
	system := WinterAssetManagementSystem current.
	sprite := WinterSprite fromRelativePath: 'pharo.png'.
	system addSprite: sprite named: 'pharo'.
	self deny: system sprites isEmpty.
	system removeSpriteNamed: 'pharo'.
	self assert: system sprites isEmpty