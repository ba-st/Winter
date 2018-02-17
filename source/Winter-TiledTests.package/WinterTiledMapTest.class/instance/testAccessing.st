tests
testAccessing
	
	| map |
	
	map := WinterTiledMap new.
	
	self
		assert: map layers isEmpty;
		assert: map properties isEmpty;
		assert: map tileSets isEmpty;
		assert: map resources isEmpty.
	
	map resources: self mapResources.
	
	self
		deny: map resources isEmpty;
		assertCollection: map resources hasSameElements: self mapResources