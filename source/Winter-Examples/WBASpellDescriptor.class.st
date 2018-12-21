Class {
	#name : #WBASpellDescriptor,
	#superclass : #WinterSpriteDescriptor,
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
WBASpellDescriptor >> loadSpritesWith: surface [
	| sprites genForm |
	genForm := self loadImageFile.
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
