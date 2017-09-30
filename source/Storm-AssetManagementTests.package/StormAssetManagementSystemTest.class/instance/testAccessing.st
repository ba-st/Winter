initialization
testAccessing
	| system |
	system := StormAssetManagementSystem current .
	self
		assert: system sounds isEmpty;
		assert: system sprites isEmpty