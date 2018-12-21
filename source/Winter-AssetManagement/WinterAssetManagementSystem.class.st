"
System to manage assets in the game
"
Class {
	#name : #WinterAssetManagementSystem,
	#superclass : #Object,
	#instVars : [
		'assets'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Winter-AssetManagement'
}

{ #category : #Singleton }
WinterAssetManagementSystem class >> current [
	uniqueInstance isNil
		ifTrue: [ uniqueInstance := self new ].
	^ uniqueInstance
]

{ #category : #Singleton }
WinterAssetManagementSystem class >> restart [
	uniqueInstance := self new 
]

{ #category : #'Asset Managing' }
WinterAssetManagementSystem >> addAsset: anAsset [
	^assets  at: anAsset name put: anAsset 
]

{ #category : #'Asset Managing' }
WinterAssetManagementSystem >> addSound: aSoundPath named: aName [

	^self addAsset: (WinterSound fromPath: aSoundPath named: aName)
]

{ #category : #'Asset Managing' }
WinterAssetManagementSystem >> addSprite: aSpritePath named: aName [
	^self addAsset:  (WinterSprite fromPath: aSpritePath named: aName)
]

{ #category : #'Asset Managing' }
WinterAssetManagementSystem >> assetNamed: aName [

	^ self assetNamed: aName ifAbsent: [ AssetNotFound signalNamed: aName ]
]

{ #category : #'Asset Managing' }
WinterAssetManagementSystem >> assetNamed: aName ifAbsent: aBlock [

	^ assets at: aName ifAbsent: aBlock
]

{ #category : #Accessing }
WinterAssetManagementSystem >> assets [
	^assets copy
]

{ #category : #Initialization }
WinterAssetManagementSystem >> initialize [
	assets := Dictionary new.
	SoundSystem soundEnabled: true.
	SoundSystem initialize.
	SoundPlayer startUpWithSound:nil.
]

{ #category : #'Asset Managing' }
WinterAssetManagementSystem >> removeAssetNamed: aName [
	^assets  removeKey: aName ifAbsent: [ AssetNotFound signalNamed: aName ]
]

{ #category : #'Asset Managing' }
WinterAssetManagementSystem >> removeSoundNamed: aName [
	^self removeAssetNamed: aName
]

{ #category : #'Asset Managing' }
WinterAssetManagementSystem >> removeSpriteNamed: aName [
	^self removeAssetNamed: aName
]

{ #category : #'Asset Managing' }
WinterAssetManagementSystem >> soundNamed: aName [

	^ self assetNamed: aName
]

{ #category : #Accessing }
WinterAssetManagementSystem >> sounds [
	^self assets
]

{ #category : #'Asset Managing' }
WinterAssetManagementSystem >> spriteNamed: aName [

	^ self assetNamed: aName
]

{ #category : #Accessing }
WinterAssetManagementSystem >> sprites [
	^ self assets
]
