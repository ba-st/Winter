Tests
testRemoveSoundFailsIfSoundDoesNotExist
	| system  |
	system := WinterAssetManagementSystem current.
	self assert: system sounds isEmpty.
	self should: [ system removeSoundNamed: 'bird' ] raise: AssetNotFound withExceptionDo: [:ex | self assert: ex messageText equals: 'Asset named bird does not exist in Asset System'].
	

