"
Class representing an abstract layer in a map
"
Class {
	#name : #WinterTiledMapLayer,
	#superclass : #Object,
	#instVars : [
		'name',
		'opacity',
		'visible',
		'offsetX',
		'offsetY',
		'parent',
		'unitScale'
	],
	#category : #'Winter-Tiled'
}

{ #category : #Drawing }
WinterTiledMapLayer >> drawOn: aCanvas [

	self subclassResponsibility
]

{ #category : #'Event Handling' }
WinterTiledMapLayer >> eventActivated: anEvent [

	unitScale := anEvent additionalInfoAt: #unitScale.
	self drawOn: anEvent canvas
]

{ #category : #'Event Handling' }
WinterTiledMapLayer >> eventUpdated: anEvent [

	unitScale := anEvent additionalInfoAt: #unitScale.
	self drawOn: anEvent canvas
]

{ #category : #initialization }
WinterTiledMapLayer >> initialize [

	name := ''.
	opacity := 1.0.
	visible := true.
	offsetX := 1.0.
	offsetY := 1.0.
	unitScale := 1.0
]

{ #category : #Accessing }
WinterTiledMapLayer >> name [

	^ name
]

{ #category : #Accessing }
WinterTiledMapLayer >> name: aName [

	name := aName
]

{ #category : #Accessing }
WinterTiledMapLayer >> offsetX [

	^offsetX    
]

{ #category : #Accessing }
WinterTiledMapLayer >> offsetX: aNumber [

	offsetX := aNumber 
]

{ #category : #Accessing }
WinterTiledMapLayer >> offsetY [

	^offsetY   
]

{ #category : #Accessing }
WinterTiledMapLayer >> offsetY: aNumber [

	offsetY := aNumber  
]

{ #category : #Accessing }
WinterTiledMapLayer >> opacity [

	^opacity 
]

{ #category : #Accessing }
WinterTiledMapLayer >> opacity: aNumber [

	opacity := aNumber
]

{ #category : #Accessing }
WinterTiledMapLayer >> parent [

	^ parent
]

{ #category : #Accessing }
WinterTiledMapLayer >> parent: aLayer [

	aLayer = self
		ifTrue: [ Error signal: 'Parent can not be self' ]
		ifFalse: [ parent := aLayer ]
]

{ #category : #Accessing }
WinterTiledMapLayer >> visible [

	^visible    
]

{ #category : #Accessing }
WinterTiledMapLayer >> visible: aBoolean [

	visible := aBoolean  
]
