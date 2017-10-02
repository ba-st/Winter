initialization
testRemoveSprite
	| system sprite |
	system := WinterAssetManagementSystem  current.
	sprite := WinterSprite fromRelativePath: 'kirby.png'.
	system addSprite: sprite named: 'kirby'.
	self deny: system sprites isEmpty.
	system removeSpriteNamed: 'kirby'.
	self assert: system sprites isEmpty