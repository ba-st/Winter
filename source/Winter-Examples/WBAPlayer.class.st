"
I am a player in the WBA game

Instance Variables
- character 
- isMoving 
- currentFoot 
- keyboardCodes 
- movementKeyDown

Public API and Key Messages:

- castSpell 
- character
- character:
- handleKeyDown:
- handleKeyUp:
- maybeMove:
- move:







"
Class {
	#name : #WBAPlayer,
	#superclass : #GameInteractiveMovableActor,
	#instVars : [
		'character',
		'isMoving',
		'currentFoot',
		'keyboardCodes',
		'movementKeyDown'
	],
	#category : #'Winter-Examples-WizardBattle'
}

{ #category : #'as yet unclassified' }
WBAPlayer class >> defaultKeyboardCodes [
	"Each array represent the key codes for a player in this specific order:
	down left right up castSpell"

	"^ Array
		with:
			(Array
				with: Character arrowUp
				with: Character arrowLeft
				with: Character arrowDown
				with: Character arrowRight
				with: Character tab)
		with: #($w $a $s $d $q)
		with: #($f $g $t $h $r)
		with: #($j $i $k $l $u)"
		
		^ #(
		#(81 80 79 82 229) "arrows and shift"
		#(22 4 7 26 20) "wasd and q"
		#(10 9 11 23 21) "fgth and r"
		#(14 13 15 12 24) "jikl and u"
		)
]

{ #category : #accessing }
WBAPlayer >> castSpell [
	character castSpell
	
]

{ #category : #accessing }
WBAPlayer >> character [
	^character
]

{ #category : #accessing }
WBAPlayer >> character: anObject [
	character := anObject
]

{ #category : #Events }
WBAPlayer >> handleKeyDown: anEvent [


	keyDownInteractions
		at: anEvent scanCode 
		ifPresent: [ :interaction | interaction value ]
		ifAbsent: [ "Do nothing" ]
]

{ #category : #Events }
WBAPlayer >> handleKeyUp: anEvent [


	keyUpInteractions
		at: anEvent scanCode 
		ifPresent: [ :interaction | interaction value ]
		ifAbsent: [ "Do nothing" ]
]

{ #category : #Events }
WBAPlayer >> handleKeyUpIndex: anIndex [
	movementKeyDown = anIndex
		ifTrue: [ movementKeyDown := nil ]
]

{ #category : #accessing }
WBAPlayer >> keyboardCodes [

	^keyboardCodes 
]

{ #category : #accessing }
WBAPlayer >> keyboards: aKeyboardsArray [
	keyboardCodes := aKeyboardsArray.
	self
		addInteractionOnKeyDownOf: (aKeyboardsArray at: 1) doing: [ self moveUp ];
		addInteractionOnKeyDownOf: (aKeyboardsArray at: 2) doing: [ self moveLeft ];
		addInteractionOnKeyDownOf: (aKeyboardsArray at: 3) doing: [ self moveDown ];
		addInteractionOnKeyDownOf: (aKeyboardsArray at: 4) doing: [ self moveRight ];
		addInteractionOnKeyDownOf: (aKeyboardsArray at: 5) doing: [ self castSpell ].
	self
		addInteractionOnKeyUpOf: (aKeyboardsArray at: 1)
			doing: [ self handleKeyUpIndex: 1 ];
		addInteractionOnKeyUpOf: (aKeyboardsArray at: 2)
			doing: [ self handleKeyUpIndex: 2 ];
		addInteractionOnKeyUpOf: (aKeyboardsArray at: 3)
			doing: [ self handleKeyUpIndex: 3 ];
		addInteractionOnKeyUpOf: (aKeyboardsArray at: 4)
			doing: [ self handleKeyUpIndex: 4 ]
]

{ #category : #navigation }
WBAPlayer >> maybeMove: aDirectionIndex [

movementKeyDown := aDirectionIndex.
character  maybeMove: aDirectionIndex
]

{ #category : #navigation }
WBAPlayer >> move: anIndexDirection [

	character isMoving
		ifTrue: [ "already moves" ]
		ifFalse: [ character isMoving: true.
			currentFoot := 1.
			game scheduler
				newGameTickAction:
					(WBACharacterMoveAnimation new
						character: character ;
						direction: anIndexDirection;
						yourself)
				for: character ]
]

{ #category : #navigation }
WBAPlayer >> moveDown [

	self maybeMove: 3
]

{ #category : #navigation }
WBAPlayer >> moveLeft [

	self maybeMove: 2
]

{ #category : #navigation }
WBAPlayer >> moveRight [

	self maybeMove: 4
]

{ #category : #navigation }
WBAPlayer >> moveUp [

	self maybeMove: 1
]

{ #category : #accessing }
WBAPlayer >> movementKeyDown [
	^movementKeyDown
	
]
