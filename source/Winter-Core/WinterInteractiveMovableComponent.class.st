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
	#name : #WinterInteractiveMovableComponent,
	#superclass : #WinterMovableComponent,
	#instVars : [
		'interactionEvents',
		'keyDownInteractions',
		'keyUpInteractions'
	],
	#category : #'Winter-Core-Base'
}

{ #category : #Interactions }
WinterInteractiveMovableComponent >> addInteractionOnKeyDownOf: aKeywordCharacter doing: anActionBlock [

	keyDownInteractions at: aKeywordCharacter put: anActionBlock  
]

{ #category : #Interactions }
WinterInteractiveMovableComponent >> addInteractionOnKeyUpOf: aKeywordCharacter doing: anActionBlock [

	keyUpInteractions at: aKeywordCharacter put: anActionBlock  
]

{ #category : #Events }
WinterInteractiveMovableComponent >> handleKeyDown: anEvent [

	keyDownInteractions
		at: anEvent character
		ifPresent: [ :interaction | interaction value ]
		ifAbsent: [ "Do nothing" ]
]

{ #category : #Events }
WinterInteractiveMovableComponent >> handleKeyUp: anEvent [

	keyUpInteractions
		at: anEvent character
		ifPresent: [ :interaction | interaction value ]
		ifAbsent: [ "Do nothing" ]
]

{ #category : #initialization }
WinterInteractiveMovableComponent >> initialize [

	super initialize.
	keyDownInteractions := Dictionary new.
	keyUpInteractions := Dictionary new.

]

{ #category : #printing }
WinterInteractiveMovableComponent >> printOn: aStream [

	aStream
		nextPutAll: ( '<1s> - position [<2s>]' expandMacrosWith: self class name with: self position )
]
