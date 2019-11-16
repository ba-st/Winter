"
Class representenging a widget decorator for some sprites that will toggle

Public API and Key Messages

- renderOn:  
- sprites
- sprites:
- toggle

 
Internal Representation and Key Implementation Points.

    Instance Variables
		sprites 
		currentSpriteIndex
	
"
Class {
	#name : #WinterToggleSingleSpriteWidget,
	#superclass : #WinterSingleSpriteWidget,
	#instVars : [
		'sprites',
		'currentSpriteIndex'
	],
	#category : #'Winter-View-ViewModel'
}

{ #category : #initialization }
WinterToggleSingleSpriteWidget >> initialize [

	super initialize.

	currentSpriteIndex  := 0.
]

{ #category : #Accessing }
WinterToggleSingleSpriteWidget >> sprites [

	^ sprites
]

{ #category : #Accessing }
WinterToggleSingleSpriteWidget >> sprites: anObject [

	sprites := anObject.
	self toggle.
]

{ #category : #Action }
WinterToggleSingleSpriteWidget >> toggle [

	currentSpriteIndex  := currentSpriteIndex \\ sprites size + 1.
	sprite := sprites at: currentSpriteIndex
]
