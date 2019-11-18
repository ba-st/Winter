"
Class representing a group Layer in a Map,containning more layers 
"
Class {
	#name : #WinterTiledMapTileGroupLayer,
	#superclass : #WinterTiledMapLayer,
	#instVars : [
		'layers'
	],
	#category : #'Winter-Tiled'
}

{ #category : #Managing }
WinterTiledMapTileGroupLayer >> addLayer: aLayer [

	layers add: aLayer
]

{ #category : #Drawing }
WinterTiledMapTileGroupLayer >> drawOn: aCanvas [

	layers do: [ :layer | layer drawOn: aCanvas ]
]

{ #category : #initialization }
WinterTiledMapTileGroupLayer >> initialize [

	super initialize .
	layers := OrderedCollection new
]

{ #category : #Accessing }
WinterTiledMapTileGroupLayer >> layers [

	^ layers
]

{ #category : #Managing }
WinterTiledMapTileGroupLayer >> removeLayer: aLayer [

	layers remove: aLayer
]
