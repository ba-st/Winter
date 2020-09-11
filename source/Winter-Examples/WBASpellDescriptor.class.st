"
I represent a descriptor of how the spell will be like


Public API and Key Messages:

- classFolder
- loadSpriteWith:using:
- spriteSize


"
Class {
	#name : #WBASpellDescriptor,
	#superclass : #GameSpriteDescriptor,
	#category : #'Winter-Examples-WizardBattle'
}

{ #category : #'as yet unclassified' }
WBASpellDescriptor class >> randomSpell [
	^ self new
		fileName: 'spell' , 6 atRandom printString;
		position: 0@0 ;
		yourself
]

{ #category : #Bootstrap }
WBASpellDescriptor >> classFolder [
	^ 'spell/'
]

{ #category : #Bootstrap }
WBASpellDescriptor >> loadSpritesWith: surface using: anAssetsManagementSystem [
	| sprites genForm |
	genForm := self loadImageFileUsing: anAssetsManagementSystem.
	sprites := Array new: 6.
	1 to: 6 do: [ :i | | point |
		point := i - 1 @ 0 * self spriteSize.
		sprites at: i put: (surface createFormPaint: (genForm copy: (point corner: self spriteSize + point))) ].
	^ sprites
]

{ #category : #Bootstrap }
WBASpellDescriptor >> spriteSize [

	^ 32 @ 48
]
