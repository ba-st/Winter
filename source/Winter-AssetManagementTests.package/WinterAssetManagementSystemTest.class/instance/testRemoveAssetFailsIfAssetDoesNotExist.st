Tests
testRemoveAssetFailsIfAssetDoesNotExist
	| system  |
	system := WinterAssetManagementSystem current.
	self assert: system assets isEmpty.
	self should: [ system removeAssetNamed: 'bird' ] raise: AssetNotFound withExceptionDo: [:ex | self assert: ex messageText equals: 'Asset named bird does not exist in Asset System'].
	

