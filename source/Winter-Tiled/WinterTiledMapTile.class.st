"
Class representing a tile of a tileSet in a tiled map
"
Class {
	#name : #WinterTiledMapTile,
	#superclass : #Object,
	#instVars : [
		'mapObjects',
		'mapProperties',
		'offSetX',
		'offSetY',
		'textureRegion'
	],
	#category : 'Winter-Tiled'
}

{ #category : #'Instance Creation' }
WinterTiledMapTile class >> of: aTextureRegion havingOffsetX: aNumber andOffsetY: anotherNumber [

	^ self new initializeOf: aTextureRegion havingOffsetX: aNumber andOffsetY: anotherNumber
]

{ #category : #initialization }
WinterTiledMapTile >> initialize [

	mapObjects := OrderedCollection new.
	mapProperties := OrderedCollection new
]

{ #category : #initialization }
WinterTiledMapTile >> initializeOf: aTextureRegion havingOffsetX: aNumber andOffsetY: anotherNumber [

	textureRegion := aTextureRegion.
	offSetX := aNumber.
	offSetY := anotherNumber
]

{ #category : #Accessing }
WinterTiledMapTile >> mapObjects [
	
	^ mapObjects
]

{ #category : #Accessing }
WinterTiledMapTile >> mapObjects: aMapObjectsCollection [
	
	mapObjects := aMapObjectsCollection
]

{ #category : #Accessing }
WinterTiledMapTile >> mapProperties [
	
	^ mapProperties 
]

{ #category : #Accessing }
WinterTiledMapTile >> mapProperties: aMapPropertiesCollection [
	
	mapProperties := aMapPropertiesCollection
]

{ #category : #Accessing }
WinterTiledMapTile >> offSetX [
	
	^ offSetX
]

{ #category : #Accessing }
WinterTiledMapTile >> offSetX: aNumber [
	
	offSetX := aNumber
]

{ #category : #Accessing }
WinterTiledMapTile >> offSetY [
	
	^ offSetY
]

{ #category : #Accessing }
WinterTiledMapTile >> offSetY: aNumber [
	
	offSetY := aNumber
]

{ #category : #Accessing }
WinterTiledMapTile >> textureRegion [
	
	^ textureRegion
]

{ #category : #Accessing }
WinterTiledMapTile >> textureRegion: aTextureRegion [
	
	textureRegion := aTextureRegion
]
