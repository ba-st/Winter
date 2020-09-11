"
I represent a descriptor of how the ground will be like


Public API and Key Messages:

- classFolder
- loadSpritesWith:using:
- spriteSize

"
Class {
	#name : #WBAGroundDescriptor,
	#superclass : #GameSpriteDescriptor,
	#category : #'Winter-Examples-WizardBattle'
}

{ #category : #accessing }
WBAGroundDescriptor class >> backgroundAt: anIndex [

	^ self new
		fileName: 'terrain';
		position: (#(0 48 96 144 192 240) at: anIndex ) @ 0 ;
		yourself
]

{ #category : #accessing }
WBAGroundDescriptor class >> randomBackground [

	^ self new
		fileName: 'terrain';
		position: #(0 48 96 144 192 240) atRandom @ 0 ;
		yourself
]

{ #category : #Bootstrap }
WBAGroundDescriptor >> classFolder [
	^ 'terrain/'
]

{ #category : #Bootstrap }
WBAGroundDescriptor >> loadSpritesWith: surface using: anAssetsManagementSystem [
	| genForm grounds |

	grounds := Array new: 2.
	genForm := self loadImageFileUsing: anAssetsManagementSystem.
	
	grounds at: 1 put: (surface createFormPaint: (genForm copy: ((0 @ 192 + position) corner: (48 @ 224 + position)))).
	grounds at: 2 put: (surface createFormPaint: (genForm copy: ((0 @ 240 + position) corner: (48 @ 272 + position)))).
	^ grounds
]

{ #category : #Bootstrap }
WBAGroundDescriptor >> spriteSize [

	^ 32 @ 48
]
