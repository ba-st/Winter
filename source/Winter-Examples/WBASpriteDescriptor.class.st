Class {
	#name : #WBASpriteDescriptor,
	#superclass : #Object,
	#instVars : [
		'fileName',
		'position'
	],
	#category : 'Winter-Examples-WizardBattle'
}

{ #category : #Bootstrap }
WBASpriteDescriptor >> basicLoadImageFile [

	^ WinterAssetManagementSystem current
		addSprite:
			('<1s>/<2s>/<3s>.png'
				expandMacrosWith: self resourceFolder
				with: self classFolder
				with: fileName)
		named: fileName
]

{ #category : #Bootstrap }
WBASpriteDescriptor >> classFolder [

	"Empty by defult, should reimplement"

	^ ''
]

{ #category : #Accessing }
WBASpriteDescriptor >> fileName [

	^ fileName
]

{ #category : #Accessing }
WBASpriteDescriptor >> fileName: anObject [

	fileName := anObject
]

{ #category : #Bootstrap }
WBASpriteDescriptor >> loadImageFile [

	^ WinterAssetManagementSystem current
		assetNamed: fileName
		ifAbsent: [ self basicLoadImageFile ]
]

{ #category : #Bootstrap }
WBASpriteDescriptor >> loadSpritesWith: surface [

	"Answers the sprites corresponding to the descriptor"
	self subclassResponsibility.
]

{ #category : #Accessing }
WBASpriteDescriptor >> position [

	^ position
]

{ #category : #Accessing }
WBASpriteDescriptor >> position: anObject [

	position := anObject
]

{ #category : #Bootstrap }
WBASpriteDescriptor >> resourceFolder [

	^ 'resources/'
]

{ #category : #Bootstrap }
WBASpriteDescriptor >> spriteSize [

	"Answers a point of the size of the sprite"
	^ 32 @ 48
]
