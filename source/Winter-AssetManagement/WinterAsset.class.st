"
I represent an abstract class for assets

Collaborators: 

- name
- nativeAsset
- path

Public API and Key Messages

- isSound   
- isSprite
- name
- path.


"
Class {
	#name : #WinterAsset,
	#superclass : #Object,
	#instVars : [
		'path',
		'nativeAsset',
		'name'
	],
	#category : #'Winter-AssetManagement'
}

{ #category : #'Instance Creation' }
WinterAsset class >> fromPath: aStringPath named: aName [

	^ self fromPath: aStringPath named: aName using: FileSystem disk
]

{ #category : #'Instance Creation' }
WinterAsset class >> fromPath: aStringPath named: aName using: aFileSystem [

	^ self subclassResponsibility 
]

{ #category : #'reflective operations' }
WinterAsset >> doesNotUnderstand: aMessage [

	"delegate all not implemented methods to the native asset"

	^ ( nativeAsset respondsTo: aMessage selector )
		ifTrue: [ nativeAsset perform: aMessage selector withEnoughArguments: aMessage arguments ]
		ifFalse: [ super doesNotUnderstand: aMessage ]
]

{ #category : #Initialization }
WinterAsset >> initializeNativeAsset: aNativeAsset filePath: aFilePath named: aName [

	nativeAsset := aNativeAsset.
	path := aFilePath.
	name := aName
]

{ #category : #'reflective operations' }
WinterAsset >> isSound [

	^ false
]

{ #category : #'reflective operations' }
WinterAsset >> isSprite [

	^ false
]

{ #category : #accessing }
WinterAsset >> name [

	^ name
]

{ #category : #accessing }
WinterAsset >> path [

	^ path
]
