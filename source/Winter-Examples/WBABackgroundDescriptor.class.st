Class {
	#name : #WBABackgroundDescriptor,
	#superclass : #WBASpriteDescriptor,
	#category : 'Winter-Examples-WizardBattle'
}

{ #category : #accessing }
WBABackgroundDescriptor class >> autumn [
	^ self new
		fileName: 'terrain';
		position: 48 @ 0 ;
		yourself
]

{ #category : #accessing }
WBABackgroundDescriptor class >> backgroundAt: i [
	^ self new
		fileName: 'terrain';
		position: (#(0 48 96 144 192 240) at: i) @ 0 ;
		yourself
]

{ #category : #accessing }
WBABackgroundDescriptor class >> randomBackground [
	^ self new
		fileName: 'terrain';
		position: #(0 48 96 144 192 240) atRandom @ 0 ;
		yourself
]

{ #category : #Bootstrap }
WBABackgroundDescriptor >> classFolder [
	^ 'terrain/'
]

{ #category : #'as yet unclassified' }
WBABackgroundDescriptor >> loadGroundSpritesWith: surface [
	| genForm grounds |

	grounds := Array new: 2.
	genForm := self loadImageFile.
	
	grounds at: 1 put: (surface createFormPaint: (genForm copy: ((0 @ 192 + position) corner: (48 @ 224 + position)))).
	grounds at: 2 put: (surface createFormPaint: (genForm copy: ((0 @ 240 + position) corner: (48 @ 272 + position)))).
	^ grounds
]

{ #category : #'as yet unclassified' }
WBABackgroundDescriptor >> loadWallSpritesWith: surface [
	| genForm walls |
	walls := Array new: 3.
	genForm := self loadImageFile.
	
	0 to: 2 do: [ :i | | topLeftCorner subRect |
		topLeftCorner := 0 @ i * self wallSpriteSize + position.
		subRect := topLeftCorner corner: self wallSpriteSize + topLeftCorner.
		walls at: i + 1 put: (surface createFormPaint: (genForm copy: subRect)) ].
	^ walls
]

{ #category : #'as yet unclassified' }
WBABackgroundDescriptor >> wallSpriteSize [
	^ 48 @ 64
]
