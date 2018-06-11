Tests
testAddSprite

	| system  |
	
	system := WinterAssetManagementSystem current.

	system addSprite: 'pharo.png' named: 'pharo'.
	self
		deny: system assets isEmpty;
		assert: (system assetNamed:  'pharo') notNil