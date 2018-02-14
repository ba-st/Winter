tests
testManaging
	
	| layer |
	
	layer := WinterTiledMapObjectsLayer new.
	
	self assert: layer objects isEmpty.
	
	layer addObject: self object.
	
	self
		deny: layer objects isEmpty;
		assert: (layer objects includes: self object).
	
	layer removeObject: self object.
	
	self assert: layer objects isEmpty