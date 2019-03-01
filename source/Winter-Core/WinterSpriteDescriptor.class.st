"
Abstract class for sprite descriptors
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
WinterSpriteDescriptor >> basicLoadImageFile [

	^ game assetsManagementSystem 
		addSprite:
			('<1s>/<2s>/<3s>.png'
				expandMacrosWith: self resourceFolder
				with: self classFolder
				with: fileName)
		named: fileName
]

{ #category : #Bootstrap }
WinterSpriteDescriptor >> basicLoadImageFileUsing: anAssetManagementSystem [

	^ anAssetManagementSystem 
		addSprite:
			('<1s>/<2s>/<3s>.png'
				expandMacrosWith: self resourceFolder
				with: self classFolder
				with: fileName)
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
