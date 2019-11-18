"
I represent a system to manage assets in the game.

Collaborators: 

- assets

Public API and Key Messages

- addSound:named:   
- addSprite:named:
- assetNamed:
- assets
- removeAssetNamed:
- sounds
- sprites.

Instance creation: 

WinterSound fromPath: aStringPath named: aName
"
Class {
	#name : #WinterAssetManagementSystem,
	#superclass : #SubsystemImplementation,
	#instVars : [
		'assets'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Winter-AssetManagement'
}

{ #category : #'Asset Managing' }
WinterAssetManagementSystem >> addAsset: anAsset [

	^ assets at: anAsset name put: anAsset
]

{ #category : #'Asset Managing' }
WinterAssetManagementSystem >> addSound: aSoundPath named: aName [

	^ self addSound: aSoundPath named: aName using: FileSystem disk
]

{ #category : #'Asset Managing' }
WinterAssetManagementSystem >> addSound: aSoundPath named: aName using: aFileSystem [

	^ self addAsset: ( WinterSound fromPath: aSoundPath named: aName using: aFileSystem )
]

{ #category : #'Asset Managing' }
WinterAssetManagementSystem >> addSprite: aSpritePath named: aName [

	^ self addSprite: aSpritePath named: aName using: FileSystem disk
]

{ #category : #'Asset Managing' }
WinterAssetManagementSystem >> addSprite: aSpritePath named: aName using: aFileSystem [

	^ self addAsset: ( WinterSprite fromPath: aSpritePath named: aName using: aFileSystem )
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

	^ assets copy
]

{ #category : #'meta-data' }
WinterAssetManagementSystem >> dependencies [

	^ #()
]

{ #category : #'meta-data' }
WinterAssetManagementSystem >> implementedInterfaces [

	^ #(#AssetsManagementSystemInterface)
]

{ #category : #Initialization }
WinterAssetManagementSystem >> initialize [

	super initialize.
	assets := Dictionary new.
	SoundSystem soundEnabled: true.
	SoundSystem initialize.
	SoundPlayer startUpWithSound: nil
]

{ #category : #'meta-data' }
WinterAssetManagementSystem >> name [

	^ 'Assets Management System'
]

{ #category : #'Asset Managing' }
WinterAssetManagementSystem >> removeAssetNamed: aName [

	^assets  removeKey: aName ifAbsent: [ AssetNotFound signalNamed: aName ]
]

{ #category : #Accessing }
WinterAssetManagementSystem >> sounds [

	^ self assets select: [ :each | each isSound ]
]

{ #category : #Accessing }
WinterAssetManagementSystem >> sprites [

	^ self assets select: [ :each | each isSprite ]
]
