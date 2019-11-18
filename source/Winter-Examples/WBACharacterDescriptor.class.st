"
I represent a descriptor of how the character will be like


Public API and Key Messages:

- classFolder
- loadSpritesWith:using:
- spriteSize


	
"
Class {
	#name : #WBACharacterDescriptor,
	#superclass : #WinterSpriteDescriptor,
	#category : #'Winter-Examples-WizardBattle'
}

{ #category : #accessing }
WBACharacterDescriptor class >> randomCharacter [
	^ self new
		fileName: 'perso' , 13 atRandom printString;
		position: #(0 96 192 288) atRandom @ #(0 192) atRandom ;
		yourself
]

{ #category : #Bootstrap }
WBACharacterDescriptor >> classFolder [
	^ 'perso/'
]

{ #category : #Bootstrap }
WBACharacterDescriptor >> loadShortSpritesWith: surface using: anAssetsManagementSystem [
	| genForm sprites |
	genForm := self loadImageFileUsing: anAssetsManagementSystem .
	sprites := Array new: 2.
	0 to: 1 do: [ :i | | topLeftCorner |
		topLeftCorner := i @ 0 * (self spriteSize * 2) + position.
		sprites 
			at:  i + 1 
			put: (surface createFormPaint: (genForm copy: (topLeftCorner corner: self spriteSize + topLeftCorner))) ].
	^ sprites
]

{ #category : #Bootstrap }
WBACharacterDescriptor >> loadSpritesWith: surface using: anAssetsManagementSystem [
	| genForm sprites |
	genForm := self loadImageFileUsing: anAssetsManagementSystem.
	sprites := Array new: 12.
	0 to: 3 do: [ :j | 
		0 to: 2 do: [ :i | | topLeftCorner |
			topLeftCorner := i @ j * self spriteSize + position.
			sprites 
				at: j * 3 + i + 1 
				put: (surface createFormPaint: (genForm copy: (topLeftCorner corner: self spriteSize + topLeftCorner))) ] ].
	^ sprites
]

{ #category : #Bootstrap }
WBACharacterDescriptor >> spriteSize [

	^ 32 @ 48
]
