"
I represent a sprite handling and image of any etension

Collaborators: 

- name
- nativeAsset
- path

Public API and Key Messages

- isSprite  
- extent
- drawOnAthensCanvas:
- path
- scaledToSize:
- type.

Instance creation: 

WinterSprite fromPath: aStringPath named: aName
"
Class {
	#name : #WinterSprite,
	#superclass : #WinterAsset,
	#category : #'Winter-AssetManagement'
}

{ #category : #'Instance Creation' }
WinterSprite class >> fromPath: aStringPath named: aName using: aFileSystem [

	^ [ | nativeImage |

	nativeImage := ( aFileSystem referenceTo: aStringPath )
		binaryReadStreamDo: [ :stream | ImageReadWriter formFromStream: stream ].
	self new initializeNativeAsset: nativeImage filePath: aStringPath named: aName
	]
		on: FileDoesNotExistException
		do:
			[ :ex | ( ex messageText: ( 'Sprite not found in <1s>' expandMacrosWith: aStringPath ) ) signal ]
]

{ #category : #Drawing }
WinterSprite >> drawOnAthensCanvas: aCanvas [

	nativeAsset asMorph drawOnAthensCanvas: aCanvas
]

{ #category : #Accessing }
WinterSprite >> extent [

	"Width and Height delegated to native asset"

	^ self width @ self height
]

{ #category : #Testing }
WinterSprite >> isSprite [

	^ true
]

{ #category : #Printing }
WinterSprite >> printOn: aStream [

	aStream
		nextPutAll: ('Sprite: <1s> - <2s>' expandMacrosWith: name with: path)
]

{ #category : #Converting }
WinterSprite >> scaledToSize: anExtent [

	nativeAsset := nativeAsset  scaledToSize: anExtent
]
