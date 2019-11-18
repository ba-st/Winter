"
Class representing a tile layer in a map
"
Class {
	#name : #WinterTiledMapTileLayer,
	#superclass : #WinterTiledMapLayer,
	#instVars : [
		'width',
		'height',
		'tileWidth',
		'tileHeight',
		'cells'
	],
	#category : #'Winter-Tiled'
}

{ #category : #'Instance Creation' }
WinterTiledMapTileLayer class >> ofWidth: width height: height tileWidth: tileWidth tileHeight: tileHeight [

	^ self new
		initializeOfWidth: width
		height: height
		tileWidth: tileWidth
		tileHeight: tileHeight
]

{ #category : #Managing }
WinterTiledMapTileLayer >> cellsAtX: anX andY: anY [

	^ cells at: anX at: anY ifInvalid: nil 
]

{ #category : #Managing }
WinterTiledMapTileLayer >> cellsAtX: anX andY: anY put: aCell [

	(anX between: 1 and: width)
		ifFalse: [ Error signal: ('Invalid X: <1s>' expandMacrosWith: anX asString) ].
	(anY between: 1 and: height)
		ifFalse: [ Error signal: ('Invalid Y: <1s>' expandMacrosWith: anY asString) ].
		
	cells at: anX at: anY put: aCell
]

{ #category : #Accessing }
WinterTiledMapTileLayer >> height [

	^ height
]

{ #category : #initialization }
WinterTiledMapTileLayer >> initializeOfWidth: aWidth height: aHeight tileWidth: aTileWidth tileHeight: aTileHeight [

	width := aWidth.
	height := aHeight.
	tileWidth := aTileWidth.
	tileHeight := aTileHeight.
	cells := Matrix rows: height columns: width
]

{ #category : #Accessing }
WinterTiledMapTileLayer >> tileHeight [

	^ tileHeight  
]

{ #category : #Accessing }
WinterTiledMapTileLayer >> tileWidth [

	^ tileWidth   
]

{ #category : #Accessing }
WinterTiledMapTileLayer >> width [

	^ width 
]
