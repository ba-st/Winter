"
Abstract class for sprite descriptors
"
Class {
	#name : #WinterSpriteDescriptor,
	#superclass : #Object,
	#instVars : [
		'fileName',
		'position'
	],
	#category : #'Winter-Core-Desriptors'
}

{ #category : #Bootstrap }
WinterSpriteDescriptor >> basicLoadImageFile [

	^ WinterAssetManagementSystem current
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
WinterSpriteDescriptor >> loadImageFile [

	^ WinterAssetManagementSystem current
		assetNamed: fileName
		ifAbsent: [ self basicLoadImageFile ]
]

{ #category : #Bootstrap }
WinterSpriteDescriptor >> loadSpritesWith: aSurface [

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
