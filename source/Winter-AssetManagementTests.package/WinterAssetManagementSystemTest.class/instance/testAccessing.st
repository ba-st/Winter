initialization
testAccessing
	| system |
	system := WinterAssetManagementSystem current .
	self
		assert: system sounds isEmpty;
		assert: system sprites isEmpty