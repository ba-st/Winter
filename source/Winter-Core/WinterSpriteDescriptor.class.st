"
I am an abstract class for sprite descriptors

Instance Variables
- fileName 
- position


Public API and Key Messages:

- loadSpritesWith:using: 
- position
- position:
- fileName
- fileName:

"
Class {
	#name : #WinterSpriteDescriptor,
	#superclass : #WinterReactiveObject,
	#instVars : [
		'fileName',
		'position'
	],
	#category : #'Winter-Core-Desriptors'
}

{ #category : #Bootstrap }
WinterSpriteDescriptor >> basicLoadImageFileUsing: anAssetManagementSystem [

	^ anAssetManagementSystem
		addSprite:
			( '<1s>/<2s>/<3s>.png' expandMacrosWith: self resourceFolder with: self classFolder with: fileName )
		named: fileName
]

{ #category : #Bootstrap }
WinterSpriteDescriptor >> classFolder [

	"Empty by defult, should reimplement"

	^ ''
]

{ #category : #Bootstrap }
WinterSpriteDescriptor >> fileName [

	^ fileName
]

{ #category : #Bootstrap }
WinterSpriteDescriptor >> fileName: anObject [

	fileName := anObject
]

{ #category : #Bootstrap }
WinterSpriteDescriptor >> loadImageFileUsing: anAssetManagementSystem [

	^ anAssetManagementSystem 
		assetNamed: fileName
		ifAbsent: [ self basicLoadImageFileUsing: anAssetManagementSystem ]
]

{ #category : #Bootstrap }
WinterSpriteDescriptor >> loadSpritesWith: aSurface using: anAssetsManagementSystem [

	"Answers the sprites corresponding to the descriptor"
	self subclassResponsibility.
]

{ #category : #Bootstrap }
WinterSpriteDescriptor >> position [

	^ position
]

{ #category : #Bootstrap }
WinterSpriteDescriptor >> position: anObject [

	position := anObject
]

{ #category : #printing }
WinterSpriteDescriptor >> printOn: aStream [

	aStream
		nextPutAll:
			( 'Sprite descriptor [<1s>]- <2s>/<3s>/<4s>.png'
				expandMacrosWith: self position
				with: self resourceFolder
				with: self classFolder
				with: fileName )
]

{ #category : #Bootstrap }
WinterSpriteDescriptor >> resourceFolder [

	"By default is resources but can be re implemented to change this"

	^ 'resources/'
]

{ #category : #Bootstrap }
WinterSpriteDescriptor >> spriteSize [

	"Answers a point of the size of the sprite"

	self subclassResponsibility
]
