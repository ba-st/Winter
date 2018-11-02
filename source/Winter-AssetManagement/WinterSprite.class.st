Class {
	#name : #WinterSprite,
	#superclass : #WinterAsset,
	#category : 'Winter-AssetManagement'
}

{ #category : #'Instance Creation' }
WinterSprite class >> fromPath: aStringPath named: aName [

	^ [ self new initializeFromAbsolutePath: aStringPath  named: aName ]
		on: FileDoesNotExist
		do:
			[ :ex | (ex messageText: ('Sprite not found in <1s>' expandMacrosWith: aStringPath)) signal ]
]

{ #category : #Drawing }
WinterSprite >> drawOnAthensCanvas: aCanvas [
	nativeAsset  asMorph drawOnAthensCanvas: aCanvas
]

{ #category : #Accessing }
WinterSprite >> extent [

	"Width and Height delegated to native asset"

	^ self width @ self height
]

{ #category : #Initialization }
WinterSprite >> initializeFromAbsolutePath: aPath named: aName [
	path := aPath .
	name := aName.
	nativeAsset  := path asFileReference 
		binaryReadStreamDo: [ :stream | ImageReadWriter formFromStream: stream ]
]

{ #category : #Accessing }
WinterSprite >> path [
	^path
]

{ #category : #Converting }
WinterSprite >> scaledToSize: anExtent [

	nativeAsset := nativeAsset  scaledToSize: anExtent
]
