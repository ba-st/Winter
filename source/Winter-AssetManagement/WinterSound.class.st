"
I represent a sound of extension aiff or wav

Collaborators: 

- name
- nativeAsset
- path

Public API and Key Messages

- isSound   
- isWav
- isAIFF
- pause
- play
- type.

Instance creation: 

WinterSound fromPath: aStringPath named: aName
"
Class {
	#name : #WinterSound,
	#superclass : #WinterAsset,
	#category : #'Winter-AssetManagement'
}

{ #category : #'Instance Creation' }
WinterSound class >> from: aSampledSound filePath: aPath named: aName [

	^ self new initializeNativeAsset: aSampledSound filePath: aPath named: aName
]

{ #category : #'Instance Creation' }
WinterSound class >> fromPath: aStringPath named: aName using: aFileSystem [

	| type substrings |

	substrings := aStringPath substrings: '.'.
	type := substrings last.

	[ type = 'wav'
		ifTrue: [ ^ self
				from: ( SampledSound fromWaveStream: ( aFileSystem referenceTo: aStringPath ) readStream )
				filePath: aStringPath
				named: aName
			]
	]
		on: FileDoesNotExistException
		do: [ :ex | ( FileDoesNotExistException signal: 'File does not exist: ' , aStringPath ) signal ].

	SoundExtensionNotSupported
		signal: type asString , ' not supported, only  .wav extension supported for now'
]

{ #category : #Testing }
WinterSound >> isSound [

	^ true
]

{ #category : #Executing }
WinterSound >> pause [

	nativeAsset pause
]

{ #category : #Executing }
WinterSound >> play [

	nativeAsset isPlaying
		ifTrue: [ "Playing" ]
		ifFalse: [ nativeAsset play ]
]

{ #category : #Executing }
WinterSound >> printOn: aStream [

	aStream
		nextPutAll:
			( 'Sound: <1s> - <2s> - [ <3s> ] '
				expandMacrosWith: name
				with: path
				with:
					( nativeAsset isPlaying
						ifTrue: [ 'Playing' ]
						ifFalse: [ 'Not playing' ] ) )
]
