Class {
	#name : #WBACharacterDescriptor,
	#superclass : #WBASpriteDescriptor,
	#category : 'Winter-Examples-WizardBattle'
}

{ #category : #accessing }
WBACharacterDescriptor class >> bestCharacterAt: i [
	"Set of good looking wizard style characters"
	| indexes |
	indexes := #(
	#(1 288 0)
	#(5 0 0)
	#(9 0 192)
	#(9 288 0)
	) at: i.
	^ self new
		fileName: 'perso' , indexes first printString;
		position: indexes second @ indexes third;
		yourself
]

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
WBACharacterDescriptor >> loadShortSpritesWith: surface [
	| genForm sprites |
	genForm := self loadImageFile.
	sprites := Array new: 2.
	0 to: 1 do: [ :i | | topLeftCorner |
		topLeftCorner := i @ 0 * (self spriteSize * 2) + position.
		sprites 
			at:  i + 1 
			put: (surface createFormPaint: (genForm copy: (topLeftCorner corner: self spriteSize + topLeftCorner))) ].
	^ sprites
]

{ #category : #Bootstrap }
WBACharacterDescriptor >> loadSpritesWith: surface [
	| genForm sprites |
	genForm := self loadImageFile.
	sprites := Array new: 12.
	0 to: 3 do: [ :j | 
		0 to: 2 do: [ :i | | topLeftCorner |
			topLeftCorner := i @ j * self spriteSize + position.
			sprites 
				at: j * 3 + i + 1 
				put: (surface createFormPaint: (genForm copy: (topLeftCorner corner: self spriteSize + topLeftCorner))) ] ].
	^ sprites
]
