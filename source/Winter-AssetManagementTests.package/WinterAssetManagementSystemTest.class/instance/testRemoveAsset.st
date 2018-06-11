Tests
testRemoveAsset

	| system  |
	
	system := WinterAssetManagementSystem current.

	system addSprite: 'pharo.png' named: 'pharo'.
	self deny: system assets isEmpty.
	system removeAssetNamed: 'pharo'.
	self assert: system assets isEmpty