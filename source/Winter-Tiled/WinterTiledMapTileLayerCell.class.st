"
Class representing a cell in a layer of a map
"
Class {
	#name : #WinterTiledMapTileLayerCell,
	#superclass : #Object,
	#instVars : [
		'tile',
		'flipHorizontally',
		'flipVertically',
		'rotation'
	],
	#classVars : [
		'Rotate0',
		'Rotate270',
		'Rotate90'
	],
	#category : #'Winter-Tiled'
}

{ #category : #initialization }
WinterTiledMapTileLayerCell class >> initialize [

	Rotate0 := 0.
	Rotate90 := 1.
	Rotate270 := 2
]

{ #category : #'Instance Creation' }
WinterTiledMapTileLayerCell class >> of: aTile flippingHorizontally: horizontally flippingVertically: vertically rotating: rotation [
	
	^ self new
		initializeOf: aTile
		flippingHorizontally: horizontally
		flippingVertically: vertically
		rotating: rotation
]

{ #category : #Accessing }
WinterTiledMapTileLayerCell class >> rotate0 [

	^ Rotate0
]

{ #category : #Accessing }
WinterTiledMapTileLayerCell class >> rotate270 [

	^ Rotate270
]

{ #category : #Accessing }
WinterTiledMapTileLayerCell class >> rotate90 [

	^ Rotate90
]

{ #category : #Accessing }
WinterTiledMapTileLayerCell >> flipHorizontally [

	^ flipHorizontally 
]

{ #category : #Accessing }
WinterTiledMapTileLayerCell >> flipHorizontally: aBoolean [

	flipHorizontally := aBoolean 
]

{ #category : #Accessing }
WinterTiledMapTileLayerCell >> flipVertically [

	^ flipVertically  
]

{ #category : #Accessing }
WinterTiledMapTileLayerCell >> flipVertically: aBoolean [

	flipVertically := aBoolean
]

{ #category : #initialization }
WinterTiledMapTileLayerCell >> initializeOf: aTile flippingHorizontally: anHorizontallyFlag flippingVertically: aVerticallyFlag rotating: aRotation [

	tile := aTile.
	flipHorizontally := anHorizontallyFlag.
	flipVertically := aVerticallyFlag.
	rotation := aRotation
]

{ #category : #Accessing }
WinterTiledMapTileLayerCell >> rotation [

	^ rotation   
]

{ #category : #Accessing }
WinterTiledMapTileLayerCell >> rotation: aNumber [

	rotation := aNumber 
]

{ #category : #Accessing }
WinterTiledMapTileLayerCell >> tile [

	^ tile
]

{ #category : #Accessing }
WinterTiledMapTileLayerCell >> tile: aTile [

	tile := aTile 
]
