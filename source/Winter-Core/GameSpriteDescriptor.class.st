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
	#name : #GameSpriteDescriptor,
	#superclass : #GameActor,
	#instVars : [
		'fileName',
		'position'
	],
	#category : #'Winter-Core-Desriptors'
}

{ #category : #Bootstrap }
GameSpriteDescriptor >> basicLoadImageFileUsing: anAssetManagementSystem [

	^ anAssetManagementSystem
		addSprite:
			( '<1s>/<2s>/<3s>.png' expandMacrosWith: self resourceFolder with: self classFolder with: fileName )
		named: fileName
]

{ #category : #Bootstrap }
GameSpriteDescriptor >> classFolder [

	"Empty by defult, should reimplement"

	^ ''
]

{ #category : #Bootstrap }
GameSpriteDescriptor >> fileName [

	^ fileName
]

{ #category : #Bootstrap }
GameSpriteDescriptor >> fileName: anObject [

	fileName := anObject
]

{ #category : #Bootstrap }
GameSpriteDescriptor >> loadImageFileUsing: anAssetManager [

	^ anAssetManager 
		assetNamed: fileName
		ifAbsent: [ self basicLoadImageFileUsing: anAssetManager ]
]

{ #category : #Bootstrap }
GameSpriteDescriptor >> loadSpritesWith: aSurface using: anAssetsManagementSystem [

	"Answers the sprites corresponding to the descriptor"
	self subclassResponsibility.
]

{ #category : #Bootstrap }
GameSpriteDescriptor >> position [

	^ position
]

{ #category : #Bootstrap }
GameSpriteDescriptor >> position: anObject [

	position := anObject
]

{ #category : #printing }
GameSpriteDescriptor >> printOn: aStream [

	aStream
		nextPutAll:
			( 'Sprite descriptor [<1s>]- <2s>/<3s>/<4s>.png'
				expandMacrosWith: self position
				with: self resourceFolder
				with: self classFolder
				with: fileName )
]

{ #category : #Bootstrap }
GameSpriteDescriptor >> resourceFolder [

	"By default is resources but can be re implemented to change this"

	^ 'resources/'
]

{ #category : #Bootstrap }
GameSpriteDescriptor >> spriteSize [

	"Answers a point of the size of the sprite"

	self subclassResponsibility
]
