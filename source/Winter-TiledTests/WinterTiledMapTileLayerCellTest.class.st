Class {
	#name : #WinterTiledMapTileLayerCellTest,
	#superclass : #TestCase,
	#category : 'Winter-TiledTests'
}

{ #category : #tests }
WinterTiledMapTileLayerCellTest >> testAccessing [
	
	| cell |
	
	cell := WinterTiledMapTileLayerCell
		of: self tile
		flippingHorizontally: true
		flippingVertically: true
		rotating: 2.0.
	
	self
		assert: cell tile equals: self tile;
		assert: cell flipHorizontally;
		assert: cell flipVertically;
		assert: cell rotation equals: 2.0.
		
	cell tile: nil; flipHorizontally: false; flipVertically: false; rotation: 1.0.
	
	self
		assert: cell tile isNil;
		deny: cell flipHorizontally;
		deny: cell flipVertically;
		assert: cell rotation equals: 1.0.
]

{ #category : #tests }
WinterTiledMapTileLayerCellTest >> testClassVariablesAccessing [
	
	"Initialize class variables"
      WinterTiledMapTileLayerCell  initialize.
	
	self
		assert: WinterTiledMapTileLayerCell rotate0 equals: 0;
		assert: WinterTiledMapTileLayerCell rotate90  equals: 1;
		assert: WinterTiledMapTileLayerCell rotate270  equals: 2	
]

{ #category : #'Test Support' }
WinterTiledMapTileLayerCellTest >> tile [
	
	^self
]
