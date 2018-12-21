"
Class representing a tiled map
"
Class {
	#name : #WinterTiledMap,
	#superclass : #Object,
	#instVars : [
		'properties',
		'layers',
		'tileSets',
		'resources'
	],
	#category : #'Winter-Tiled'
}

{ #category : #Managing }
WinterTiledMap >> addLayer: aLayer [

	layers add: aLayer
]

{ #category : #Managing }
WinterTiledMap >> addTileSet: aTileSet [

	tileSets  add: aTileSet
]

{ #category : #initialization }
WinterTiledMap >> initialize [

	layers := OrderedCollection new.
	properties := Dictionary new.
	tileSets  := OrderedCollection new.
	resources := OrderedCollection new.
]

{ #category : #Accessing }
WinterTiledMap >> layers [

	^ layers  
]

{ #category : #Accessing }
WinterTiledMap >> properties [

	^ properties values 
]

{ #category : #Managing }
WinterTiledMap >> propertiesAt: aKey [

	^properties at: aKey
]

{ #category : #Managing }
WinterTiledMap >> propertiesAt: aKey put: aValue [

	properties at: aKey put: aValue
]

{ #category : #Accessing }
WinterTiledMap >> resources [

	^resources
]

{ #category : #Accessing }
WinterTiledMap >> resources: aResourcesCollection [ 

	resources := aResourcesCollection.
]

{ #category : #Accessing }
WinterTiledMap >> tileSets [

	^ tileSets 
]

{ #category : #Managing }
WinterTiledMap >> tilesAt: anId [

	^tileSets  detect: [:each | each hasTileWithId: anId]  ifFound: [ :tileSet | tileSet tilesAt: anId  ]  ifNone: [ nil ]
]
