"
I represent a moving animation of a spell

Instance Variables
- spell


Public API and Key Messages:

- spell
- spell: 
- movingElement
- midAnimation

"
Class {
	#name : #WBASpellMoveAnimation,
	#superclass : #WBAMoveAnimation,
	#instVars : [
		'spell'
	],
	#category : #'Winter-Examples-WizardBattle'
}

{ #category : #private }
WBASpellMoveAnimation >> midAnimation [

	spell switchCell: shiftIncr
]

{ #category : #Accessing }
WBASpellMoveAnimation >> movingElement [

	^ spell
]

{ #category : #Accessing }
WBASpellMoveAnimation >> spell [

	^ spell
]

{ #category : #Accessing }
WBASpellMoveAnimation >> spell: aSpell [

	spell := aSpell
]
