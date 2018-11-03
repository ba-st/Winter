Class {
	#name : #WinterTiledMapTest,
	#superclass : #TestCase,
	#instVars : [
		'tileSet'
	],
	#category : 'Winter-TiledTests'
}

{ #category : #'Test Support' }
WinterTiledMapTest >> layer [

	^self
]

{ #category : #'Test Support' }
WinterTiledMapTest >> mapResources [

	^ Array with: self
]

{ #category : #'Test Support' }
WinterTiledMapTest >> property [

	^self
]

{ #category : #tests }
WinterTiledMapTest >> setUp [

tileSet := (WinterTiledMapTileSet named: 'tileset') tilesAt: 1 put: self tile; yourself
]

{ #category : #tests }
WinterTiledMapTest >> testAccessing [
	
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
]

{ #category : #tests }
WinterTiledMapTest >> testManaging [
	
	| map |
	
	map := WinterTiledMap new.
	
	self
		assert: map layers isEmpty;
		assert: map properties isEmpty;
		assert: map tileSets isEmpty;
		assert: map resources isEmpty;
		assert: (map tilesAt: 1) isNil.
	
	map addLayer: self layer.
	map propertiesAt: #property put: self property.
	map addTileSet: self tileSet.
	
	self
		deny: map layers isEmpty;
		assert: (map layers includes: self layer);
		deny: map properties isEmpty;
		assert: (map propertiesAt: #property) equals: self property;
		deny: map tileSets isEmpty;
		assert: (map tileSets includes: self tileSet);
		assert: (map tilesAt: 1) equals: self tile.
	

]

{ #category : #'Test Support' }
WinterTiledMapTest >> tile [

	^self
]

{ #category : #'Test Support' }
WinterTiledMapTest >> tileSet [
	^tileSet
]
