initialization
testAddSprite
	| system sprite|
	system := StormAssetManagementSystem current .
	sprite := StormSprite fromRelativePath: 'kirby.png'.
	system addSprite: sprite named:'kirby'.
	self
		deny: system sprites isEmpty;
		assert: (system spriteNamed:'kirby') equals: sprite
		