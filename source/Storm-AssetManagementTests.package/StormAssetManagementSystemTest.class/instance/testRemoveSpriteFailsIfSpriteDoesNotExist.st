initialization
testRemoveSpriteFailsIfSpriteDoesNotExist
	| system  |
	system := StormAssetManagementSystem current.
	self assert: system sprites isEmpty.
	self should: [ system removeSpriteNamed: 'kirby' ] raise: AssetNotFound withExceptionDo: [:ex | self assert: ex messageText equals: 'Asset named kirby does not exist in Asset System'].