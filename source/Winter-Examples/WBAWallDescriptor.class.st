"
I represent a descriptor of how the wall will be like


Public API and Key Messages:

- classFolder
- loadSpriteWith:using:
- spriteSize


"
Class {
	#name : #WBAWallDescriptor,
	#superclass : #WinterSpriteDescriptor,
	#category : #'Winter-Examples-WizardBattle'
}

{ #category : #accessing }
WBAWallDescriptor class >> backgroundAt: anIndex [
	^ self new
		fileName: 'terrain';
		position: (#(0 48 96 144 192 240) at: anIndex) @ 0 ;
		yourself
]

{ #category : #accessing }
WBAWallDescriptor class >> randomBackground [

	^ self new
		fileName: 'terrain';
		position: #(0 48 96 144 192 240) atRandom @ 0 ;
		yourself
]

{ #category : #Bootstrap }
WBAWallDescriptor >> classFolder [
	^ 'terrain/'
]

{ #category : #Bootstrap }
WBAWallDescriptor >> loadSpritesWith: surface using: anAssetsManagementSystem [

	| genForm walls |

	walls := Array new: 3.
	genForm := self loadImageFileUsing: anAssetsManagementSystem.
	
	0 to: 2 do: [ :i | | topLeftCorner subRect |
		topLeftCorner := 0 @ i * self spriteSize + position.
		subRect := topLeftCorner corner: self spriteSize + topLeftCorner.
		walls at: i + 1 put: (surface createFormPaint: (genForm copy: subRect)) ].
	^ walls
]

{ #category : #Bootstrap }
WBAWallDescriptor >> spriteSize [
	^ 48 @ 64
]
