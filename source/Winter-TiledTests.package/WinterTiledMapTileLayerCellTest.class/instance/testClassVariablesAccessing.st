tests
testClassVariablesAccessing
	
	"Initialize class variables"
      WinterTiledMapTileLayerCell  initialize.
	
	self
		assert: WinterTiledMapTileLayerCell rotate0 equals: 0;
		assert: WinterTiledMapTileLayerCell rotate90  equals: 1;
		assert: WinterTiledMapTileLayerCell rotate270  equals: 2	