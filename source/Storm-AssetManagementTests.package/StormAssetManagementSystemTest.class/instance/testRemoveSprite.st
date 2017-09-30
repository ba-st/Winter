initialization
testRemoveSprite
	| system sprite |
	system := StormAssetManagementSystem  current.
	sprite := StormSprite fromRelativePath: 'kirby.png'.
	system addSprite: sprite named: 'kirby'.
	self deny: system sprites isEmpty.
	system removeSpriteNamed: 'kirby'.
	self assert: system sprites isEmpty