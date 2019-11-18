"
I am a class to represent active elements in a game,can be controlled by the user

Instance Variables
- interactionEvents 
- sprite 
- collisionShape 
- keyDownInteractions 
- keyUpInteractions 


Public API and Key Messages:

- collisionShape
- collisionShape:
- position
- position:
- handleKeyDown:
- handleKeyUp:
- renderOn:
- updateUsing:

"
Class {
	#name : #WinterPlayer,
	#superclass : #WinterAliveComponentXXX,
	#instVars : [
		'interactionEvents',
		'keyDownInteractions',
		'keyUpInteractions'
	],
	#category : #'Winter-Core-Base'
}

{ #category : #Interactions }
WinterPlayer >> addInteractionOnKeyDownOf: aKeywordCharacter doing: anActionBlock [

	keyDownInteractions at: aKeywordCharacter put: anActionBlock  
]

{ #category : #Interactions }
WinterPlayer >> addInteractionOnKeyUpOf: aKeywordCharacter doing: anActionBlock [

	keyUpInteractions at: aKeywordCharacter put: anActionBlock  
]

{ #category : #Collisions }
WinterPlayer >> checkCollisions [

	"re implement if you want to do something"

	
]

{ #category : #Events }
WinterPlayer >> handleKeyDown: anEvent [

	keyDownInteractions
		at: anEvent character
		ifPresent: [ :interaction | interaction value ]
		ifAbsent: [ "Do nothing" ]
]

{ #category : #Events }
WinterPlayer >> handleKeyUp: anEvent [

	keyUpInteractions
		at: anEvent character
		ifPresent: [ :interaction | interaction value ]
		ifAbsent: [ "Do nothing" ]
]

{ #category : #initialization }
WinterPlayer >> initialize [

	super initialize.
	keyDownInteractions := Dictionary new.
	keyUpInteractions := Dictionary new.

]

{ #category : #initialization }
WinterPlayer >> initializeCollisionShape [

	"re implement if you want to do something"

	
]

{ #category : #initialization }
WinterPlayer >> initializeResources [

	"re implement if you want to do something"

	
]

{ #category : #initialization }
WinterPlayer >> initializeSprite [

	"re implement if you want to do something"

	
]

{ #category : #printing }
WinterPlayer >> printOn: aStream [

	aStream
		nextPutAll: ( '<1s> - position [<2s>]' expandMacrosWith: self class name with: self position )
]
