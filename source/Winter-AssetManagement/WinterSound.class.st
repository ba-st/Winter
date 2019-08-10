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
	#instVars : [
		'type'
	],
	#category : #'Winter-AssetManagement'
}

{ #category : #'Instance Creation' }
WinterSound class >> from: aSampledSound fileType: aType filePath: aPath named: aName [

	^ self new initializeSound: aSampledSound type: aType filePath: aPath named: aName
]

{ #category : #'Instance Creation' }
WinterSound class >> fromPath: aStringPath named: aName [
	| type substrings |
	substrings := aStringPath substrings: '.'.
	type := substrings last.
	[ type = 'wav'
		ifTrue: [ ^ self 
				from: (SampledSound fromWaveFileNamed: aStringPath)
				fileType: type
				filePath: aStringPath
				named: aName ].
	type = 'aiff'
		ifTrue: [ ^ self 
				from: (SampledSound fromAIFFfileNamed: aStringPath)
				fileType: type
				filePath: aStringPath
				named: aName ] ]
		on: FileDoesNotExistException
		do: [ :ex | 
			(FileDoesNotExist
				signal: 'File does not exist: ' , aStringPath)
				signal ].
	SoundExtensionNotSupported
		signal:
			type asString
				,
					' not supported, only .aiff and .wav extension supported for now'
]

{ #category : #Initialization }
WinterSound >> initializeSound: aSound type: aType filePath: aFilePath named: aName [
	nativeAsset  := aSound.
	type := aType.
	path := aFilePath.
	name := aName
]

{ #category : #Testing }
WinterSound >> isAIFF [
	^type = #aiff
]

{ #category : #Testing }
WinterSound >> isSound [
	^ true
]

{ #category : #Testing }
WinterSound >> isWav [
	^type =#wav
]

{ #category : #Executing }
WinterSound >> pause [
	nativeAsset  pause
]

{ #category : #Executing }
WinterSound >> play [
	nativeAsset  isPlaying
		ifTrue: [ "Playing" ]
		ifFalse: [ nativeAsset play ]
]

{ #category : #Accessing }
WinterSound >> type [
	^ type
]
