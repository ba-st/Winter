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

{ #category : #'as yet unclassified' }
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

{ #category : #initialization }
WBASpell >> onCD [
	^ DateAndTime now - spellCD < cooldown
]

{ #category : #initialization }
WBASpell >> scheduler [
	^ scheduler
]

{ #category : #initialization }
WBASpell >> scheduler: anObject [
	scheduler := anObject
]

{ #category : #initialization }
WBASpell >> spellCD [
	^ spellCD
]

{ #category : #initialization }
WBASpell >> spellCD: anObject [
	spellCD := anObject
]

{ #category : #initialization }
WBASpell >> sprites [
	^ sprites
]

{ #category : #initialization }
WBASpell >> sprites: anObject [
	sprites := anObject
]

{ #category : #initialization }
WBASpell >> updateSpellCD [
	
	spellCD := DateAndTime now.
]
