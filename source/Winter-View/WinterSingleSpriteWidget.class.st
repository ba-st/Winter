"
Represents a widget decorator for a single sprite
"
Class {
	#name : #WinterSingleSpriteWidget,
	#superclass : #WinterWidget,
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
