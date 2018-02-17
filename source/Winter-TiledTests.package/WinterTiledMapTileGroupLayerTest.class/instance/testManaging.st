tests
testManaging
	
	| layer |
	
	layer := WinterTiledMapTileGroupLayer new.
	
	self assert: layer layers isEmpty.
	
	layer addLayer: self layer.
	
	self
		deny: layer layers isEmpty;
		assert: (layer layers includes: self layer).
	
	layer removeLayer: self layer.
	
	self assert: layer layers isEmpty