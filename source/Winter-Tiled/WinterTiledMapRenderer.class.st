Class {
	#name : #WinterTiledMapRenderer,
	#superclass : #WinterComponent,
	#category : 'Winter-Tiled'
}

{ #category : #'Instance Creation' }
WinterTiledMapRenderer class >> of: aMap [

	^self of: aMap usingAsUnitScale: 1.0
]

{ #category : #'Instance Creation' }
WinterTiledMapRenderer class >> of: aMap usingAsUnitScale: aNumber [

	^ self new initializeOf: aMap usingAsUnitScale: aNumber
]

{ #category : #Events }
WinterTiledMapRenderer >> eventActivated: anEvent [

	anEvent additionalInfoAt: #unitScale put: unitScale.
	map layers do: [ :layer | layer eventActivated: anEvent ]
]

{ #category : #Events }
WinterTiledMapRenderer >> eventUpdated: anEvent [

	anEvent additionalInfoAt: #unitScale put: unitScale.
	map layers do: [ :layer | layer eventUpdated: anEvent ]
]

{ #category : #initialization }
WinterTiledMapRenderer >> initializeOf: aMap usingAsUnitScale: aNumber [

	map := aMap.
	unitScale := aNumber
]

{ #category : #Accessing }
WinterTiledMapRenderer >> map [

	^ map
]

{ #category : #Accessing }
WinterTiledMapRenderer >> unitScale [

	^ unitScale
]

{ #category : #Accessing }
WinterTiledMapRenderer >> unitScale: aNumber [ 

	unitScale := aNumber
]
