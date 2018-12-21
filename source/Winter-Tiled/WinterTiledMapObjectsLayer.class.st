"
Class representing an objects layer in a Map
"
Class {
	#name : #WinterTiledMapObjectsLayer,
	#superclass : #WinterTiledMapLayer,
	#instVars : [
		'objects'
	],
	#category : #'Winter-Tiled'
}

{ #category : #Managing }
WinterTiledMapObjectsLayer >> addObject: aMapObject [

	objects add: aMapObject
]

{ #category : #Drawing }
WinterTiledMapObjectsLayer >> drawOn: aCanvas [

	"Objcts should be kind of WinterMapObject"

	objects do: [ :object | object drawOn: aCanvas ]
]

{ #category : #initialization }
WinterTiledMapObjectsLayer >> initialize [

	super initialize .
	objects := OrderedCollection new
]

{ #category : #Accessing }
WinterTiledMapObjectsLayer >> objects [

	^ objects
]

{ #category : #Managing }
WinterTiledMapObjectsLayer >> removeObject: aMapObject [

	objects remove: aMapObject
]
