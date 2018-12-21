Class {
	#name : #WBACharacterMoveAnimation,
	#superclass : #WBAMoveAnimation,
	#instVars : [
		'character'
	],
	#category : #'Winter-Examples-WizardBattle'
}

{ #category : #Accessing }
WBACharacterMoveAnimation >> character [
	^ character
]

{ #category : #Accessing }
WBACharacterMoveAnimation >> character: aCharacter [
	 character := aCharacter 
]

{ #category : #private }
WBACharacterMoveAnimation >> midAnimation [
	character switchFoot.
	shiftIncr := character switchCell: shiftIncr
]

{ #category : #Accessing }
WBACharacterMoveAnimation >> movingElement [
	^ character 
]
