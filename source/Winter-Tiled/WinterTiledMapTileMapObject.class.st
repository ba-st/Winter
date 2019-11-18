"
Representation of a Tile Map Object
"
Class {
	#name : #WinterTiledMapTileMapObject,
	#superclass : #WinterMapObject,
	#instVars : [
		'tile',
		'flipHorizontally',
		'flipVertically',
		'textureRegion',
		'originX',
		'originY',
		'scaleX',
		'scaleY',
		'rotation'
	],
	#category : #'Winter-Tiled'
}

{ #category : #'Instance Creation' }
WinterTiledMapTileMapObject class >> from: aTile horizontally: flagFlipHorizontally vertically: flagFlipVertically [

	^ self new initializeFrom: aTile horizontally: flagFlipHorizontally vertically: flagFlipVertically
]

{ #category : #Accessing }
WinterTiledMapTileMapObject >> flipHorizontally [

	^ flipHorizontally 
]

{ #category : #Accessing }
WinterTiledMapTileMapObject >> flipHorizontally: aBoolean [

	flipHorizontally := aBoolean
]

{ #category : #Accessing }
WinterTiledMapTileMapObject >> flipVertically [

	^ flipVertically
]

{ #category : #Accessing }
WinterTiledMapTileMapObject >> flipVertically: aBoolean [

	flipVertically  := aBoolean
]

{ #category : #initialization }
WinterTiledMapTileMapObject >> initialize [

	super initialize.
	x := 0.0.
	y := 0.0.
	originX := 0.0.
	originY := 0.0.
	scaleX := 1.0.
	scaleY := 1.0.
	rotation := 0.0
]

{ #category : #initialization }
WinterTiledMapTileMapObject >> initializeFrom: aTile horizontally: flagFlipHorizontally vertically: flagFlipVertically [

	tile := aTile.
	flipHorizontally := flagFlipHorizontally.
	flipVertically := flagFlipVertically.
	textureRegion := WinterTextureRegion fromAnotherTextureRegion: tile textureRegion.
	textureRegion
		flipX: flipHorizontally;
		flipY: flipVertically
]

{ #category : #Accessing }
WinterTiledMapTileMapObject >> originX [

	^ originX
]

{ #category : #Accessing }
WinterTiledMapTileMapObject >> originX: aNumber [

	originX := aNumber
]

{ #category : #Accessing }
WinterTiledMapTileMapObject >> originY [

	^ originY
]

{ #category : #Accessing }
WinterTiledMapTileMapObject >> originY: aNumber [

	originY := aNumber
]

{ #category : #Accessing }
WinterTiledMapTileMapObject >> rotation [

	^ rotation
]

{ #category : #Accessing }
WinterTiledMapTileMapObject >> rotation: aNumber [

	rotation := aNumber
]

{ #category : #Accessing }
WinterTiledMapTileMapObject >> scaleX [

	^ scaleX
]

{ #category : #Accessing }
WinterTiledMapTileMapObject >> scaleX: aNumber [

	scaleX := aNumber
]

{ #category : #Accessing }
WinterTiledMapTileMapObject >> scaleY [

	^ scaleY
]

{ #category : #Accessing }
WinterTiledMapTileMapObject >> scaleY: aNumber [

	scaleY := aNumber
]

{ #category : #Accessing }
WinterTiledMapTileMapObject >> textureRegion [

	^ textureRegion 
]

{ #category : #Accessing }
WinterTiledMapTileMapObject >> tile [

	^ tile
]
