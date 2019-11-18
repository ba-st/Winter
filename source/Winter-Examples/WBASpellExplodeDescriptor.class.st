"
I represent a descriptor of how the spell explode will be like


Public API and Key Messages:

- classFolder
- loadSpriteWith:using:
- spriteSize


"
Class {
	#name : #WBASpellExplodeDescriptor,
	#superclass : #WinterSpriteDescriptor,
	#category : #'Winter-Examples-WizardBattle'
}

{ #category : #Bootstrap }
WBASpellExplodeDescriptor >> classFolder [
	^ 'spell/'
]

{ #category : #Bootstrap }
WBASpellExplodeDescriptor >> loadSpritesWith: surface using: anAssetsManagementSystem [
	| sprites genForm |
	genForm := self loadImageFileUsing: anAssetsManagementSystem.
	sprites := Array new: 3.
	4 to: 6 do: [ :i | | point |
		point := i - 1 @ 0 * self spriteSize.
		sprites at: i - 3 put: (surface createFormPaint: (genForm copy: (point corner: self spriteSize + point))) ].
	^ sprites
]

{ #category : #Bootstrap }
WBASpellExplodeDescriptor >> spriteSize [

	^ 32 @ 48
]
