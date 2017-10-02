initialization
testAddSprite
	| system sprite|
	system := WinterAssetManagementSystem current .
	sprite := WinterSprite fromRelativePath: 'kirby.png'.
	system addSprite: sprite named:'kirby'.
	self
		deny: system sprites isEmpty;
		assert: (system spriteNamed:'kirby') equals: sprite
		