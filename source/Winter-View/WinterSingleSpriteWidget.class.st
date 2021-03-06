"
Class representenging a widget decorator for a single sprite

Public API and Key Messages

- renderOn:  
- sprite
- sprite:

 
Internal Representation and Key Implementation Points.

    Instance Variables
		sprite
	
"
Class {
	#name : #WinterSingleSpriteWidget,
	#superclass : #BaseWidget,
	#instVars : [
		'sprite'
	],
	#category : #'Winter-View-ViewModel'
}

{ #category : #rendering }
WinterSingleSpriteWidget >> renderOn: aCanvas [

	aCanvas setPaint: sprite.
	aCanvas draw
]

{ #category : #rendering }
WinterSingleSpriteWidget >> sprite [

	^ sprite
]

{ #category : #rendering }
WinterSingleSpriteWidget >> sprite: anObject [

	sprite := anObject
]
