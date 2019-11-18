"
I am a spell in the WBA game

Instance Variables
- scheduler 
- sprites 
- spellCD 
- cooldown

Public API and Key Messages:

- castFrom: 
- onCD
- scheduler
- scheduler:
- spellCD
- spellCD:
- sprites
- sprites:
- updateSpellCD







"
Class {
	#name : #WBASpell,
	#superclass : #Object,
	#instVars : [
		'scheduler',
		'sprites',
		'spellCD',
		'cooldown'
	],
	#category : #'Winter-Examples-WizardBattle'
}

{ #category : #Action }
WBASpell >> castFrom: character [
	| sp |
	self onCD ifTrue: [ ^ self ].
	self updateSpellCD.
	character cell spells add: (sp := WBACastedSpell new
		direction: character direction;
		character: character;
		sprites: sprites;
		scheduler: scheduler;
		cell: character cell;
		yourself).
	sp startAnimation.
]

{ #category : #initialization }
WBASpell >> initialize [

	super initialize.

	self updateSpellCD.
	cooldown := 0.8 second
]

{ #category : #Testing }
WBASpell >> onCD [

	^ DateAndTime now - spellCD < cooldown
]

{ #category : #Accessing }
WBASpell >> scheduler [
	^ scheduler
]

{ #category : #Accessing }
WBASpell >> scheduler: anObject [
	scheduler := anObject
]

{ #category : #Accessing }
WBASpell >> spellCD [
	^ spellCD
]

{ #category : #Accessing }
WBASpell >> spellCD: anObject [
	spellCD := anObject
]

{ #category : #Accessing }
WBASpell >> sprites [
	^ sprites
]

{ #category : #Accessing }
WBASpell >> sprites: anObject [
	sprites := anObject
]

{ #category : #Updating }
WBASpell >> updateSpellCD [
	
	spellCD := DateAndTime now.
]
