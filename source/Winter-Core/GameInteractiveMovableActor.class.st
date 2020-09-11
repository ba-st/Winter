"
I am a class to represent active elements in a game,can be controlled by the user

Instance Variables
- interactionEvents 
- keyDownInteractions 
- keyUpInteractions 


Public API and Key Messages:

- handleKeyDown:
- handleKeyUp:
- addInteractionOnKeyDownOf::doing:
- addInteractionOnKeyUpOf::doing:
"
Class {
	#name : #GameInteractiveMovableActor,
	#superclass : #GameMovableActor,
	#instVars : [
		'interactionEvents',
		'keyDownInteractions',
		'keyUpInteractions'
	],
	#category : #'Winter-Core-Base'
}

{ #category : #Interactions }
GameInteractiveMovableActor >> addInteractionOnKeyDownOf: aKeywordCharacter doing: anActionBlock [

	keyDownInteractions at: aKeywordCharacter put: anActionBlock  
]

{ #category : #Interactions }
GameInteractiveMovableActor >> addInteractionOnKeyUpOf: aKeywordCharacter doing: anActionBlock [

	keyUpInteractions at: aKeywordCharacter put: anActionBlock  
]

{ #category : #Events }
GameInteractiveMovableActor >> handleKeyDown: anEvent [

	keyDownInteractions
		at: anEvent character
		ifPresent: [ :interaction | interaction value ]
		ifAbsent: [ "Do nothing" ]
]

{ #category : #Events }
GameInteractiveMovableActor >> handleKeyUp: anEvent [

	keyUpInteractions
		at: anEvent character
		ifPresent: [ :interaction | interaction value ]
		ifAbsent: [ "Do nothing" ]
]

{ #category : #initialization }
GameInteractiveMovableActor >> initialize [

	super initialize.
	keyDownInteractions := Dictionary new.
	keyUpInteractions := Dictionary new.

]

{ #category : #printing }
GameInteractiveMovableActor >> printOn: aStream [

	aStream
		nextPutAll: ( '<1s> - position [<2s>]' expandMacrosWith: self class name with: self position )
]
