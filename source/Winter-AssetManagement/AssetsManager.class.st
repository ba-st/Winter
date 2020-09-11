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
	#name : #AssetsManager,
	#superclass : #Object,
	#instVars : [
		'assets'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Winter-AssetManagement'
}

{ #category : #'Asset Managing' }
AssetsManager >> addAsset: anAsset [

	^ assets at: anAsset name put: anAsset
]

{ #category : #'Asset Managing' }
AssetsManager >> addSound: aSoundPath named: aName [

	^ self addSound: aSoundPath named: aName using: FileSystem disk
]

{ #category : #'Asset Managing' }
AssetsManager >> addSound: aSoundPath named: aName using: aFileSystem [

	| sound |

	sound := SampledSound
		fromWaveStream: (aFileSystem referenceTo: aSoundPath) readStream.
	assets at: aName put: sound
]

{ #category : #'Asset Managing' }
AssetsManager >> addSprite: aSpritePath named: aName [

	^ self addSprite: aSpritePath named: aName using: FileSystem disk
]

{ #category : #'Asset Managing' }
AssetsManager >> addSprite: aSpritePath named: aName applying: aBlock [

	^ self
		addSprite: aSpritePath
		named: aName
		using: FileSystem disk
		applying: aBlock
]

{ #category : #'Asset Managing' }
AssetsManager >> addSprite: aSpritePath named: aName using: aFileSystem [

	^self
		addSprite: aSpritePath
		named: aName
		using: aFileSystem
		applying: [ :aForm | aForm ]
]

{ #category : #'Asset Managing' }
AssetsManager >> addSprite: aSpritePath named: aName using: aFileSystem applying: aBlock [

	| texture |

	texture := ( aFileSystem referenceTo: aSpritePath )
		binaryReadStreamDo: [ :stream | ImageReadWriter formFromStream: stream ].
	texture := aBlock value: texture.
	^ assets at: aName put: texture
]

{ #category : #'Asset Managing' }
AssetsManager >> assetNamed: aName [

	^ self assetNamed: aName ifAbsent: [ AssetNotFound signalNamed: aName ]
]

{ #category : #'Asset Managing' }
AssetsManager >> assetNamed: aName ifAbsent: aBlock [

	^ assets at: aName ifAbsent: aBlock
]

{ #category : #Accessing }
AssetsManager >> assets [

	^ assets copy
]

{ #category : #Initialization }
AssetsManager >> initialize [

	super initialize.
	assets := Dictionary new.
	"SoundSystem soundEnabled: true.
	SoundSystem initialize.
	SoundPlayer startUpWithSound: nil"
]

{ #category : #Accessing }
AssetsManager >> name [

	^ 'Assets Manager'
]

{ #category : #'Asset Managing' }
AssetsManager >> removeAssetNamed: aName [

	^assets  removeKey: aName ifAbsent: [ AssetNotFound signalNamed: aName ]
]
